import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'nft_model.dart';

part 'portfolio_entity.freezed.dart';

/// Domain aggregate representing a wallet's on-chain portfolio snapshot.
///
/// This entity is UI-agnostic — presentation widgets consume it via Riverpod
/// without knowing whether data came from Moralis, Alchemy, or a mock source.
@freezed
class PortfolioEntity with _$PortfolioEntity {
  const factory PortfolioEntity({
    required String walletAddress,
    required double balanceEth,
    required String balanceFormatted,
    required List<NFTModel> nfts,
    @Default(0) int totalNftCount,
  }) = _PortfolioEntity;
}
