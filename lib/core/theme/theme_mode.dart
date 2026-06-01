import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_adv/core/theme/colour_pallet.dart';

class AppThemeMode {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme.of(
        context,
      ).copyWith(titleLarge: GoogleFonts.montserrat(fontSize: 16)),
      colorScheme: ColorScheme.fromSeed(seedColor: ColorPallet.primary),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme.of(context).copyWith(
        titleLarge: GoogleFonts.montserrat(fontSize: 24),
        bodyMedium: GoogleFonts.beVietnamPro(fontSize: 16),
        bodySmall: GoogleFonts.beVietnamPro(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorPallet.primary),
    );
  }
}
