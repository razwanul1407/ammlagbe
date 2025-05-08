import 'package:ammlagbe/core/constants/app_colors.dart';
import 'package:ammlagbe/core/constants/app_values.dart';
import 'package:flutter/material.dart';

const kAppBarIconTheme = IconThemeData(color: Colors.black, size: 24);

final kFacebookButtonStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.facebookBlue),
  elevation: const WidgetStatePropertyAll(AppValues.elevationLvl0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppValues.radiusRounded_60),
    ),
  ),
);

final kGoogleButtonStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.neutral50),
  elevation: const WidgetStatePropertyAll(AppValues.elevationLvl0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppValues.radiusRounded_60),
    ),
  ),
);

final kPrimaryButtonStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.primary800),
  elevation: const WidgetStatePropertyAll(AppValues.elevationLvl0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppValues.radiusRounded_60),
    ),
  ),
);

final kSecondaryButtonStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.primary100),
  elevation: const WidgetStatePropertyAll(AppValues.elevationLvl0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppValues.radiusRounded_60),
    ),
  ),
);

final kDisabledButtonStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.neutral300),
  elevation: const WidgetStatePropertyAll(AppValues.elevationLvl0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppValues.radiusRounded_60),
    ),
  ),
);

final appTheme = ThemeData(
  primaryColor: Color(0xFFFDCB58), // Mango Yellow
  scaffoldBackgroundColor: Color(0xFFFFF8E1), // Off White
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFFDCB58),
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFFDCB58),
    primary: Color(0xFFFDCB58),
    secondary: Color(0xFF4CAF50),
    onPrimary: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF4CAF50),
  ),
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Color(0xFF5D4037)),
    bodyMedium: TextStyle(color: Color(0xFF212121)),
  ),
);
