import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_style.dart';

ThemeData appDarkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackGround,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackGround,
      foregroundColor: AppColors.primary,
    ),
    // colorScheme is used to save your colors .
    colorScheme: ColorScheme.fromSeed(
        primary: AppColors.primary,
        surface: AppColors.darkBackGround,
        onSurface: AppColors.white, //for text
        seedColor: AppColors.primary,
        error: AppColors.red),
    datePickerTheme:
        const DatePickerThemeData(backgroundColor: AppColors.darkBackGround),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: AppColors.darkBackGround,
      dialBackgroundColor: AppColors.darkBackGround,
      
    ),

    // fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getSmallStyle(color: AppColors.white),
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
