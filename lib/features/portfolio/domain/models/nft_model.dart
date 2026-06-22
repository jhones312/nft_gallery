import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_model.freezed.dart';

/// Immutable NFT model parsed from Moralis indexer responses.
///
/// Moralis returns nested `normalized_metadata` for human-readable fields.
/// We flatten the most useful properties here for the presentation layer.
@freezed
class NFTModel with _$NFTModel {
  const factory NFTModel({
    required String tokenAddress,
    required String tokenId,
    String? name,
    String? description,
    String? imageUrl,
    String? collectionName,
    String? contractType,
  }) = _NFTModel;

  const NFTModel._();

  factory NFTModel.fromJson(Map<String, dynamic> json) =>
      _$NFTModelFromJson(json);

  /// Maps Moralis `/nft` result item shape to [NFTModel].
  ///
  /// API reference:
  /// https://docs.moralis.io/web3-data-api/evm/reference/get-wallet-nfts
  factory NFTModel.fromMoralis(Map<String, dynamic> json) {
    final metadata = json['normalized_metadata'] as Map<String, dynamic>? ?? {};
    final rawImage = metadata['image'] as String? ?? json['token_uri'] as String?;

    return NFTModel(
      tokenAddress: json['token_address'] as String? ?? '',
      tokenId: json['token_id']?.toString() ?? '',
      name: metadata['name'] as String? ?? json['name'] as String? ?? 'Unnamed NFT',
      description: metadata['description'] as String?,
      imageUrl: resolveNftImageUrl(rawImage),
      collectionName: json['name'] as String?,
      contractType: json['contract_type'] as String?,
    );
  }

  /// Stable hero tag for shared-element transitions between grid and detail routes.
  String get heroTag => '$tokenAddress-$tokenId';
}

/// Moralis sometimes returns IPFS URLs without a gateway prefix.
String? resolveNftImageUrl(String? url) {
  if (url == null || url.isEmpty) return null;
  if (url.startsWith('ipfs://')) {
    return url.replaceFirst('ipfs://', 'https://ipfs.io/ipfs/');
  }
  return url;
}

/// Moralis native balance response (value is in wei as a string).
@freezed
class MoralisBalanceResponse with _$MoralisBalanceResponse {
  const factory MoralisBalanceResponse({
    required String balance,
  }) = _MoralisBalanceResponse;

  const MoralisBalanceResponse._();

  factory MoralisBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MoralisBalanceResponseFromJson(json);

  /// Converts wei string to ETH double for display.
  double get balanceEth {
    try {
      final wei = BigInt.parse(balance);
      return wei.toDouble() / 1e18;
    } catch (_) {
      return 0;
    }
  }

  String get formattedBalance => '${balanceEth.toStringAsFixed(4)} ETH';
}
