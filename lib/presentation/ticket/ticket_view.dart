import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_recruitment/presentation/ticket/widgets/custom_button.dart';
import 'package:test_recruitment/presentation/ticket/widgets/dashed_divider.dart';
import 'package:test_recruitment/presentation/ticket/widgets/ticket_detail_card.dart';
import 'package:test_recruitment/theme/app_color.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});
  static const String pageName = "/ticket";
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColor.bgTicket,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            children: [
              Center(
                child: Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/bg-ticket.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      _buildTopInfoSection(),
                      SizedBox(height: 24.h),
                      const DashedDivider(),
                      SizedBox(height: 24.h),
                      const TicketDetailCard(),
                      SizedBox(height: 24.h),
                      _buildActions(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopInfoSection() {
    return Column(
      children: [
        Container(
          width: 84.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(height: 12.h),
        Text("Bae",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.titleColor,
            )),
        SizedBox(height: 8.h),
        Text("Transféré le 02 Février 2025",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.dateColor.withOpacity(0.6),
            )),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("État des transactions: ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.titleColor,
                  )),
              Text("Payé",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.green,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          CustomButton(
            text: "Quitter",
            onPressed: () {
              print("quitter");
            },
            styleType: ButtonStyleType.filled,
          ),
          SizedBox(height: 12.h),
          CustomButton(
            text: "Transférer de nouveau",
            onPressed: () {
              print("transferer");
            },
            styleType: ButtonStyleType.outlined,
          ),
        ],
      ),
    );
  }

}