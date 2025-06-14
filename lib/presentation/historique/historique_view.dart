import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test_recruitment/presentation/historique/widgets/solde_card_widget.dart';
import 'package:test_recruitment/presentation/historique/widgets/transaction_item_widget.dart';

import '../../../theme/app_color.dart';

class HistoriqueView extends StatelessWidget {
  const HistoriqueView({super.key});
  static const String pageName = "/historique";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Historique',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.titleColor,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.bgCardHistorique,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.all(10.r),
                      child: Image.asset(
                        "assets/images/filter.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),

                /// Cartes Soldes
                SizedBox(
                  height: 80.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SoldeCardWidget(
                        color: AppColor.bgCardHistorique,
                        widgetImg: Image.asset("assets/images/up.png"),
                        label: 'Recharge',
                        amount: '+12,750',
                        textColor: AppColor.green,
                      ),
                      SizedBox(width: 16.w),
                      SoldeCardWidget(
                        color: AppColor.bgCardHistorique,
                        widgetImg: Image.asset("assets/images/down.png"),
                        label: 'Retrait',
                        amount: '-12,750',
                        textColor: AppColor.primaryColor,
                      ),
                      SizedBox(width: 16.w),
                      SoldeCardWidget(
                        color: AppColor.bgCardHistorique,
                        widgetImg: Image.asset("assets/images/down.png"),
                        label: 'Retrait',
                        amount: '-12,750',
                        textColor: AppColor.primaryColor,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                /// Titre du graphique
                Text('Historique des soldes en FCFA',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.titleColor)),
                SizedBox(height: 12.h),

                /// Graphique
                Container(
                  height: 220.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.bgCardHistorique,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        drawHorizontalLine: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: AppColor.titleColor.withOpacity(0.1),
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: AppColor.titleColor.withOpacity(0.3),
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final months = ["Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan"];
                              return Text(
                                months[value.toInt() % months.length],
                                style: TextStyle(fontSize: 10.sp),
                              );
                            },
                            interval: 1,
                          ),
                        ),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 100),
                            FlSpot(1, 200),
                            FlSpot(2, 400),
                            FlSpot(3, 700),
                            FlSpot(4, 100),
                            FlSpot(5, 350),
                            FlSpot(6, 550),
                          ],
                          isCurved: true,
                          color: AppColor.primaryColor,
                          barWidth: 3.w,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                AppColor.primaryColor.withOpacity(0.4),
                                AppColor.primaryColor.withOpacity(0.0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          dotData: const FlDotData(show: false),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Titre section transactions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Historique de transactions',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.titleColor)),
                    Text('Voir tout',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.seeMoreTxtColor))
                  ],
                ),
                SizedBox(height: 12.h),

                /// Transactions
                TransactionItemWidget(
                  widgetImg: Image.asset("assets/images/up.png", color: AppColor.iconColor, width: 30.w, height: 40.h),
                  title: 'Eneo',
                  subtitle: 'De Bae',
                  amountUp: '-5 000',
                  amountDown: '-50',
                  unity: "Fcfa",
                  unityTextColor: AppColor.primaryColor,
                  time: 'il y a 1h de temps',
                  status: 'Succès',
                  statusColor: AppColor.green,
                  colorUp: AppColor.amountColor,
                  colorDown: AppColor.titleColor,
                ),
                SizedBox(height: 24.h),
                TransactionItemWidget(
                  widgetImg: Image.asset("assets/images/transfer.png", color: AppColor.iconColor, width: 30.w, height: 40.h),
                  title: 'Bae',
                  subtitle: 'De Afriland Visa',
                  amountUp: '+5 000',
                  amountDown: '0',
                  unity: "Fcfa",
                  unityTextColor: AppColor.green,
                  time: '26 Juin 2024',
                  status: 'Succès',
                  statusColor: AppColor.green,
                  colorUp: AppColor.amountColor,
                  colorDown: AppColor.titleColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
