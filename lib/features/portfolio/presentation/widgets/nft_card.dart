import 'dart:ui';

import 'package:cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/nft_model.dart';

/// Glassmorphism NFT tile with Hero animation support.
///
/// Presentation-only widget — receives a pre-mapped [NFTModel] from the
/// domain layer and never performs network calls directly.
class NFTCard extends StatelessWidget {
  const NFTCard({
    super.key,
    required this.nft,
    required this.index,
    this.onTap,
  });

  final NFTModel nft;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: nft.heroTag,
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.glassBorder),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.glassFill,
                      Colors.white.withValues(alpha: 0.03),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _NftImage(imageUrl: nft.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nft.name ?? 'Unnamed NFT',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '#${nft.tokenId}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.white60,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (index * 60).ms)
        .slideY(begin: 0.08, end: 0, duration: 400.ms, delay: (index * 60).ms);
  }
}

class _NftImage extends StatelessWidget {
  const _NftImage({this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        color: Colors.white10,
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined, color: Colors.white38),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(color: Colors.white10),
      errorWidget: (_, __, ___) => Container(
        color: Colors.white10,
        child: const Icon(Icons.broken_image_outlined, color: Colors.white38),
      ),
    );
  }
}
