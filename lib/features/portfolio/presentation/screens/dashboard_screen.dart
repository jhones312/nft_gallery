import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/portfolio_entity.dart';
import '../../domain/models/nft_model.dart';
import '../providers/portfolio_notifier.dart';
import '../widgets/balance_header.dart';
import '../widgets/nft_card.dart';
import '../widgets/skeleton_view.dart';
import 'nft_detail_screen.dart';

/// Primary dashboard — observes [portfolioProvider] via [AsyncValue].
///
/// UI responsibilities only:
/// - Render loading skeletons, error states, or the NFT grid.
/// - Delegate all data fetching to [PortfolioNotifier] (never call Dio here).
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late PortfolioQuery _query;

  @override
  void initState() {
    super.initState();
    _query = const PortfolioQuery();
  }

  @override
  Widget build(BuildContext context) {
    final portfolioAsync = ref.watch(portfolioProvider(_query));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('NFT Portfolio'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () =>
                ref.read(portfolioProvider(_query).notifier).refresh(),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0F),
              Color(0xFF14141F),
              Color(0xFF0A0A0F),
            ],
          ),
        ),
        child: SafeArea(
          child: portfolioAsync.when(
            loading: () => const SkeletonView(),
            error: (error, _) => _ErrorView(
              message: error.toString(),
              onRetry: () =>
                  ref.read(portfolioProvider(_query).notifier).refresh(),
            ),
            data: (portfolio) => RefreshIndicator(
              onRefresh: () =>
                  ref.read(portfolioProvider(_query).notifier).refresh(),
              color: AppTheme.darkTheme.colorScheme.primary,
              child: _PortfolioContent(
                portfolio: portfolio,
                onNftTap: (nft) => _openNftDetail(context, nft),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showWalletSheet,
        icon: const Icon(Icons.search_rounded),
        label: const Text('Wallet'),
      ),
    );
  }

  void _openNftDetail(BuildContext context, NFTModel nft) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => NftDetailScreen(nft: nft),
      ),
    );
  }

  void _showWalletSheet() {
    final controller = TextEditingController(text: _query.walletAddress);

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF14141F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter Wallet Address',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '0x...',
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.06),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  final address = controller.text.trim();
                  if (address.isNotEmpty) {
                    setState(() {
                      _query = PortfolioQuery(walletAddress: address);
                    });
                    Navigator.pop(context);
                  }
                },
                child: const Text('Load Portfolio'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _query = const PortfolioQuery(
                      walletAddress: ApiConstants.defaultWalletAddress,
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text('Reset to demo wallet'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  const _PortfolioContent({
    required this.portfolio,
    required this.onNftTap,
  });

  final PortfolioEntity portfolio;
  final void Function(NFTModel nft) onNftTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: BalanceHeader(portfolio: portfolio),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Your NFTs',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        if (portfolio.nfts.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.inbox_outlined,
                      size: 48, color: Colors.white.withValues(alpha: 0.3)),
                  const SizedBox(height: 12),
                  Text(
                    'No NFTs found in this wallet',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _gridCrossAxisCount(context),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.72,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final nft = portfolio.nfts[index];
                  return NFTCard(
                    nft: nft,
                    index: index,
                    onTap: () => onNftTap(nft),
                  );
                },
                childCount: portfolio.nfts.length,
              ),
            ),
          ),
      ],
    );
  }

  int _gridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded,
                size: 56, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'Failed to load portfolio',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white60,
                  ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
