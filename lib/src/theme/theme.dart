import 'package:flutter/material.dart';
import 'color.dart';
import 'text_style.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.background,
    colorScheme: const ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.primaryDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.text),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.heading1,
      headlineMedium: AppTextStyle.heading2,
      bodyMedium: AppTextStyle.body,
      labelSmall: AppTextStyle.caption,
      titleMedium: AppTextStyle.button,
    ),
  );
}
