import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_recruitment/theme/app_color.dart';

enum ButtonStyleType { filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyleType styleType;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.styleType = ButtonStyleType.filled,
  });

  @override
  Widget build(BuildContext context) {
    final isFilled = styleType == ButtonStyleType.filled;

    return isFilled
        ? ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        minimumSize: Size(double.infinity, 62.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
    )
        : OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        side: const BorderSide(color: AppColor.primaryColor),
        minimumSize: Size(double.infinity, 62.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}