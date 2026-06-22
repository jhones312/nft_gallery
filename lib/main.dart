import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/portfolio/presentation/screens/dashboard_screen.dart';

/// Application entry point.
///
/// Setup checklist:
/// 1. Install Flutter SDK: https://docs.flutter.dev/get-started/install
/// 2. From this folder run: `flutter create . --project-name nft_gallery`
/// 3. Install deps: `flutter pub get`
/// 4. Regenerate freezed (optional): `dart run build_runner build --delete-conflicting-outputs`
/// 5. Run with API key: `flutter run --dart-define=MORALIS_API_KEY=your_key`
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0A0A0F),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    const ProviderScope(
      child: NftGalleryApp(),
    ),
  );
}

/// Root widget — configures theme and initial route.
class NftGalleryApp extends StatelessWidget {
  const NftGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Gallery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
