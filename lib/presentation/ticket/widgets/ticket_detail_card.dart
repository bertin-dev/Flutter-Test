import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_recruitment/theme/app_color.dart';

class TicketDetailCard extends StatelessWidget {
  const TicketDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColor.titleColor.withOpacity(0.1), width: 2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Source", style: TextStyle(fontSize: 14.sp, color: AppColor.titleColor)),
          Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: const Color(0xFF9E938F),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mastercard",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.titleColor)),
                  Text("Débit *8490",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.titleColor.withOpacity(0.5))),
                ],
              )
            ],
          ),
          Divider(height: 32.h),
          Text("Résumé de paiement",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.titleColor.withOpacity(0.5))),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColor.titleColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                _rowText("Montant", "10.000 FCFA"),
                SizedBox(height: 8.h),
                _rowText("Frais de transfert", "100 FCFA"),
                Divider(height: 24.h),
                _rowText("Total", "10.100 FCFA",
                    isBold: true, highlight: true),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rowText(String label, String value,
      {bool isBold = false, bool highlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.titleColor.withOpacity(0.5),
            )),
        Text(value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w700,
              fontSize: isBold ? 16.sp : 14.sp,
              color: highlight ? AppColor.primaryColor : AppColor.titleColor,
            )),
      ],
    );
  }
}
