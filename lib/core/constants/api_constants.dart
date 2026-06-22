/// Centralized API configuration for the Moralis indexer.
///
/// API key priority:
/// 1. `--dart-define=MORALIS_API_KEY=...` (CI / production)
/// 2. `api_secrets.local.dart` (local dev, gitignored)
///
/// Moralis docs: https://docs.moralis.io/web3-data-api/evm/reference
import 'api_secrets.local.dart';

class ApiConstants {
  ApiConstants._();

  /// Moralis Web3 Data API base URL (v2.2).
  static const String moralisBaseUrl = 'https://deep-index.moralis.io/api/v2.2';

  /// Moralis API key — overridden by --dart-define when provided.
  static const String moralisApiKey = String.fromEnvironment(
    'MORALIS_API_KEY',
    defaultValue: localMoralisApiKey,
  );

  /// Default demo wallet (Vitalik's public address) for out-of-the-box testing.
  static const String defaultWalletAddress =
      '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045';

  /// EVM chain identifier accepted by Moralis (eth = Ethereum mainnet).
  static const String defaultChain = 'eth';

  /// Header name Moralis expects for authentication.
  static const String apiKeyHeader = 'X-API-Key';

  /// Endpoints are composed as: {baseUrl}/{walletAddress}/balance|nft
  static String walletBalancePath(String address) => '/$address/balance';
  static String walletNftsPath(String address) => '/$address/nft';
}
