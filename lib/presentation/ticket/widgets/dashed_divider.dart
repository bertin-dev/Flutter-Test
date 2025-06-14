import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_recruitment/theme/app_color.dart';

class DashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashHeight;
  final Color color;

  const DashedDivider({
    super.key,
    this.height = 1.0,
    this.dashWidth = 6.0,
    this.dashHeight = 2.0,
    this.color = AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int dashCount = (constraints.maxWidth / (dashWidth + 2)).floor();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(dashCount, (index) {
                    return Container(
                      width: dashWidth,
                      height: dashHeight,
                      color: color,
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}