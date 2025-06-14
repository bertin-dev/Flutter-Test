import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_color.dart';
import '../controllers/home_controller.dart';
import '../models/bottom_nav_item_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

     const List<BottomNavItemModel> items = [
      BottomNavItemModel(icon: "assets/images/home.png", label: "Accueil"),
      BottomNavItemModel(icon: "assets/images/wallet.png", label: "Portefeuille"),
      BottomNavItemModel(icon: "assets/images/send.png", label: ""),
      BottomNavItemModel(icon: "assets/images/historique.png", label: "Historique"),
      BottomNavItemModel(icon: "assets/images/user.png", label: "Compte"),
    ];

    return Obx(() => Container(
      height: 90.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          if (index == 2) {
            return GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Container(
                width: 55.w,
                height: 55.w,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.send, // icône centrale spéciale
                    color: AppColor.white,
                    size: 24.sp,
                  ),
                ),
              ),
            );
          }

          final item = items[index];

          return GestureDetector(
            onTap: () => controller.changeTab(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  item.icon,
                  color: controller.currentIndex.value == index
                      ? AppColor.primaryColor
                      : Colors.grey,
                  width: 22.w,
                  height: 22.h,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.label,
                  style: TextStyle(
                    color: controller.currentIndex.value == index
                        ? AppColor.primaryColor
                        : Colors.grey,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ));
  }
}
