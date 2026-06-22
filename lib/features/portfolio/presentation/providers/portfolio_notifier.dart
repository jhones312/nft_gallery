import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../domain/entities/portfolio_entity.dart';

/// Immutable input for portfolio fetches — changing [walletAddress] triggers reload.
class PortfolioQuery {
  const PortfolioQuery({
    this.walletAddress = ApiConstants.defaultWalletAddress,
    this.chain = ApiConstants.defaultChain,
  });

  final String walletAddress;
  final String chain;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioQuery &&
          walletAddress == other.walletAddress &&
          chain == other.chain;

  @override
  int get hashCode => Object.hash(walletAddress, chain);
}

/// Riverpod AsyncNotifier that owns portfolio fetch lifecycle.
///
/// Uses [AsyncValue] so the UI can pattern-match loading / error / data states
/// without imperative setState or manual boolean flags.
class PortfolioNotifier
    extends AutoDisposeFamilyAsyncNotifier<PortfolioEntity, PortfolioQuery> {
  @override
  Future<PortfolioEntity> build(PortfolioQuery query) async {
    final repository = ref.read(portfolioRepositoryProvider);
    return repository.fetchPortfolio(
      walletAddress: query.walletAddress,
      chain: query.chain,
    );
  }

  /// Pull-to-refresh and retry actions delegate here.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(portfolioRepositoryProvider);
      return repository.fetchPortfolio(
        walletAddress: arg.walletAddress,
        chain: arg.chain,
      );
    });
  }
}

/// Family provider keyed by [PortfolioQuery] (wallet + chain).
final portfolioProvider = AsyncNotifierProvider.autoDispose
    .family<PortfolioNotifier, PortfolioEntity, PortfolioQuery>(
  PortfolioNotifier.new,
);