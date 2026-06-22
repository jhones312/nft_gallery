import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// High-contrast dark theme tuned for NFT imagery and glassmorphism overlays.
class AppTheme {
  AppTheme._();

  static const Color _background = Color(0xFF0A0A0F);
  static const Color _surface = Color(0xFF14141F);
  static const Color _primary = Color(0xFF7C3AED);
  static const Color _accent = Color(0xFF06B6D4);
  static const Color _error = Color(0xFFEF4444);
  static const Color _onBackground = Color(0xFFF8FAFC);

  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _background,
      colorScheme: const ColorScheme.dark(
        surface: _surface,
        primary: _primary,
        secondary: _accent,
        error: _error,
        onSurface: _onBackground,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: _onBackground,
        displayColor: _onBackground,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _background.withValues(alpha: 0.85),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: _onBackground,
        ),
      ),
      cardTheme: CardTheme(
        color: _surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: _surface,
        contentTextStyle: GoogleFonts.inter(color: _onBackground),
      ),
    );
  }

  /// Gradient used behind glass cards for depth.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF7C3AED),
      Color(0xFF2563EB),
      Color(0xFF06B6D4),
    ],
  );

  /// Glass overlay tint for NFT cards.
  static Color glassFill = Colors.white.withValues(alpha: 0.08);
  static Color glassBorder = Colors.white.withValues(alpha: 0.18);
}
