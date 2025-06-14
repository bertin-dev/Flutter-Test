import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.bg,
      //fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: AppColor.white),
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.titleColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 14.sp,
          color: AppColor.subTitleColor,
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          minimumSize: Size(double.infinity, 62.h),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          minimumSize: Size(double.infinity, 62.h),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              BorderSide(color: AppColor.subTitleColor.withOpacity(0.4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.primaryColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColor.primaryColor,
        onPrimary: AppColor.white,
        secondary: AppColor.secondaryColor,
        onSecondary: AppColor.black,
        surface: AppColor.white,
        onSurface: AppColor.titleColor,
        error: Colors.red,
        onError: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryColorDark,
      scaffoldBackgroundColor: AppColor.bgDark,
      //fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryColorDark,
        iconTheme: const IconThemeData(color: AppColor.white),
        titleTextStyle: TextStyle(
          color: AppColor.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.titleColorDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 14.sp,
          color: AppColor.subTitleColorDark,
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          minimumSize: Size(double.infinity, 62.h),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.primaryColorDark),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          minimumSize: Size(double.infinity, 62.h),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.primaryColorDark),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      colorScheme: ColorScheme.dark(
        primary: AppColor.primaryColorDark,
        onPrimary: AppColor.black,
        secondary: AppColor.secondaryColorDark,
        onSecondary: AppColor.white,
        surface: Color(0xFF121212),
        onSurface: AppColor.titleColorDark,
        error: Colors.red.shade400,
        onError: Colors.black,
      ),
    );
  }
}
