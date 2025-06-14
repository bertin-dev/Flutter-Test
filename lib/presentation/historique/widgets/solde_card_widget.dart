import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_color.dart';

class SoldeCardWidget extends StatelessWidget {
  final Color color;
  final Widget widgetImg;
  final String label;
  final String amount;
  final Color textColor;

  const SoldeCardWidget({
    super.key,
    required this.color,
    required this.widgetImg,
    required this.label,
    required this.amount,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(12.r),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: textColor.withOpacity(0.1),
            ),
            child: widgetImg,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: amount,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.top,
                      child: Transform.translate(
                        offset: const Offset(1, 0),
                        child: Text(
                          'FCFA',
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColor.titleColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}