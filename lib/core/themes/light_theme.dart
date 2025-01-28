import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

ThemeData applightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      surface: AppColors.white,
      onSurface: AppColors.darkBackGround,
      seedColor: AppColors.primary,
        error: AppColors.red
    ),
    datePickerTheme:
        const DatePickerThemeData(backgroundColor: AppColors.white),
    timePickerTheme:
        const TimePickerThemeData(backgroundColor: AppColors.white ,dialBackgroundColor: AppColors.white),
    // fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallStyle(),
      suffixIconColor: AppColors.primary,
      prefixIconColor: AppColors.primary,
      // constraints: const BoxConstraints(maxHeight: 60),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(10),
      ),
    ));
