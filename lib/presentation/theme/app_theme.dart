import 'package:flutter/material.dart';

class AppTheme {
  static const _bgColor = Color(0xFF0D0F14);
  static const _surfaceColor = Color(0xFF161B24);
  static const _cardColor = Color(0xFF1E2535);
  static const _accentColor = Color(0xFF4FFFB0);
  static const _accentSecondary = Color(0xFF7C6AF7);
  static const _textPrimary = Color(0xFFE8EDF5);
  static const _textSecondary = Color(0xFF6B7A99);
  static const _borderColor = Color(0xFF252D3D);
  static const _errorColor = Color(0xFFFF4F6A);

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _bgColor,
      fontFamily: 'Courier',
      colorScheme: const ColorScheme.dark(
        surface: _surfaceColor,
        primary: _accentColor,
        secondary: _accentSecondary,
        error: _errorColor,
        onSurface: _textPrimary,
        onPrimary: _bgColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _surfaceColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: _textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        iconTheme: IconThemeData(color: _accentColor),
      ),
      cardTheme: CardThemeData(
        color: _cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: _borderColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _accentColor,
          foregroundColor: _bgColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _accentColor,
          side: const BorderSide(color: _accentColor),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _accentColor, width: 1.5),
        ),
        labelStyle: const TextStyle(color: _textSecondary),
        hintStyle: const TextStyle(color: _textSecondary),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(color: _textPrimary),
      ),
      dividerTheme: const DividerThemeData(color: _borderColor, thickness: 1),
      iconTheme: const IconThemeData(color: _textSecondary),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: _textPrimary, fontWeight: FontWeight.w800),
        titleLarge: TextStyle(color: _textPrimary, fontWeight: FontWeight.w700, letterSpacing: 0.5),
        titleMedium: TextStyle(color: _textPrimary, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: _textPrimary),
        bodyMedium: TextStyle(color: _textSecondary),
        labelLarge: TextStyle(color: _accentColor, fontWeight: FontWeight.w700, letterSpacing: 1),
      ),
      extensions: const [AppColors(
        bgColor: _bgColor,
        surfaceColor: _surfaceColor,
        cardColor: _cardColor,
        accentColor: Color.fromARGB(255, 79, 255, 176),
        accentSecondary: _accentSecondary,
        textPrimary: _textPrimary,
        textSecondary: _textSecondary,
        borderColor: _borderColor,
        errorColor: _errorColor,
      )],
    );
  }
}

class AppColors extends ThemeExtension<AppColors> {
  final Color bgColor;
  final Color surfaceColor;
  final Color cardColor;
  final Color accentColor;
  final Color accentSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color borderColor;
  final Color errorColor;

  const AppColors({
    required this.bgColor,
    required this.surfaceColor,
    required this.cardColor,
    required this.accentColor,
    required this.accentSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.borderColor,
    required this.errorColor,
  });

  @override
  AppColors copyWith({
    Color? bgColor, Color? surfaceColor, Color? cardColor,
    Color? accentColor, Color? accentSecondary, Color? textPrimary,
    Color? textSecondary, Color? borderColor, Color? errorColor,
  }) {
    return AppColors(
      bgColor: bgColor ?? this.bgColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      cardColor: cardColor ?? this.cardColor,
      accentColor: accentColor ?? this.accentColor,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      borderColor: borderColor ?? this.borderColor,
      errorColor: errorColor ?? this.errorColor,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) => this;
}
