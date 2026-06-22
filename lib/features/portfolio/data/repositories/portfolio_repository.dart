import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/portfolio_entity.dart';
import '../../domain/models/nft_model.dart';

/// Riverpod provider exposing [PortfolioRepository] to the state layer.
final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  return PortfolioRepository(dio: DioClient.instance);
});

/// Fetches wallet balance and NFT holdings from the Moralis indexer API.
///
/// Integration flow:
/// 1. [fetchPortfolio] fires parallel requests for `/balance` and `/nft`.
/// 2. Raw JSON is mapped into domain [PortfolioEntity] + [NFTModel] instances.
/// 3. The notifier layer consumes the entity — never Dio or JSON directly.
class PortfolioRepository {
  PortfolioRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Loads a complete portfolio snapshot for [walletAddress].
  Future<PortfolioEntity> fetchPortfolio({
    required String walletAddress,
    String chain = ApiConstants.defaultChain,
  }) async {
    try {
      // Parallel fetch reduces perceived latency on the dashboard.
      final results = await Future.wait([
        _fetchBalance(walletAddress: walletAddress, chain: chain),
        _fetchNfts(walletAddress: walletAddress, chain: chain),
      ]);

      final balanceResponse = results[0] as MoralisBalanceResponse;
      final nftResult = results[1] as _NftFetchResult;

      return PortfolioEntity(
        walletAddress: walletAddress,
        balanceEth: balanceResponse.balanceEth,
        balanceFormatted: balanceResponse.formattedBalance,
        nfts: nftResult.nfts,
        totalNftCount: nftResult.total,
      );
    } on DioException catch (e) {
      throw PortfolioException(_mapDioError(e));
    } catch (e) {
      throw PortfolioException('Unexpected error: $e');
    }
  }

  /// GET /{address}/balance?chain=eth
  /// Returns native token balance in wei; converted to ETH in [MoralisBalanceResponse].
  Future<MoralisBalanceResponse> _fetchBalance({
    required String walletAddress,
    required String chain,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.walletBalancePath(walletAddress),
      queryParameters: {'chain': chain},
    );

    return MoralisBalanceResponse.fromJson(
      response.data ?? const {'balance': '0'},
    );
  }

  /// GET /{address}/nft?chain=eth&format=decimal&limit=50
  /// Paginated NFT list — we request the first page for the gallery grid.
  Future<_NftFetchResult> _fetchNfts({
    required String walletAddress,
    required String chain,
    int limit = 50,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.walletNftsPath(walletAddress),
      queryParameters: {
        'chain': chain,
        'format': 'decimal',
        'limit': limit,
      },
    );

    final data = response.data ?? {};
    final rawList = data['result'] as List<dynamic>? ?? [];
    final total = data['total'] as int? ?? rawList.length;

    final nfts = rawList
        .whereType<Map<String, dynamic>>()
        .map(NFTModel.fromMoralis)
        .toList();

    return _NftFetchResult(nfts: nfts, total: total);
  }

  String _mapDioError(DioException error) {
    if (error.response?.statusCode == 401) {
      return 'Invalid API key. Add your Moralis key via --dart-define=MORALIS_API_KEY=xxx';
    }
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return 'Request timed out. Check your network connection.';
    }
    if (error.type == DioExceptionType.connectionError) {
      return 'Unable to reach Moralis API. Check your internet connection.';
    }
    return error.message ?? 'Failed to load portfolio data.';
  }
}

class _NftFetchResult {
  const _NftFetchResult({required this.nfts, required this.total});

  final List<NFTModel> nfts;
  final int total;
}

/// Typed failure surfaced to [PortfolioNotifier] and the UI via AsyncValue.error.
class PortfolioException implements Exception {
  PortfolioException(this.message);

  final String message;

  @override
  String toString() => message;
}
