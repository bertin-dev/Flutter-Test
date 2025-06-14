import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_color.dart';

class TransactionItemWidget extends StatelessWidget {
  final Widget widgetImg;
  final String title;
  final String subtitle;
  final String amountUp;
  final String amountDown;
  final String unity;
  final Color unityTextColor;
  final String time;
  final String status;
  final Color statusColor;
  final Color colorUp;
  final Color colorDown;

  const TransactionItemWidget({
    super.key,
    required this.widgetImg,
    required this.title,
    required this.subtitle,
    required this.amountUp,
    required this.amountDown,
    required this.unity,
    required this.unityTextColor,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.colorUp,
    required this.colorDown,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(13.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
            color: colorUp.withOpacity(0.1),
          ),
          child: widgetImg,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColor.titleColor)),
              SizedBox(height: 6.h),
              Text(subtitle, style: TextStyle(fontSize: 13.sp, color: AppColor.titleColor.withOpacity(0.5))),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(amountUp, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: colorUp)),
                Text(" / ", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: colorUp)),
                Text(amountDown, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: colorDown)),
                Text(" $unity", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: unityTextColor)),
              ],
            ),
            Row(
              children: [
                Text('$time, ', style: TextStyle(fontSize: 12.sp, color: AppColor.titleColor.withOpacity(0.5))),
                Text(status, style: TextStyle(fontSize: 12.sp, color: statusColor))
              ],
            )
          ],
        )
      ],
    );
  }
}