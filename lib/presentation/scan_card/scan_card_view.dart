import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_recruitment/presentation/scan_card/widgets/scanner_overlay.dart';
import '../../../theme/app_color.dart';
import '../../common/widgets/loader.dart';
import 'controllers/scan_card_controller.dart';

class ScanCardView extends GetView<ScanCardController> {
  const ScanCardView({super.key});
  static const String pageName = "/scan_card";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: SafeArea(
        child: Obx(() {
          if (!controller.isCameraInitialized.value) {
            return const Center(child: Loader());
          }
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    InkWell(
                      child: Container(
                        width: 40.0.w,
                        height: 40.0.h,
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5.0,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset("assets/images/arrow_left.png"),
                      ),
                      onTap: () => Get.back(),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Scannez votre carte bancaire',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.titleColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Scannez le recto de votre carte bancaire',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.subTitleColor.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Center(
                      child: Container(
                        height: 220.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Fond transparent
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        // Supprimer le contenu de ce container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CameraPreview(controller.cameraController),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Recto de la carte',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.titleColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Positionner de manière précise les\n04 coins de l\'avant dans le cadre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.subTitleColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Obx(() => Text(
                      controller.detectedText.value,
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: controller.toggleFlash,
                          child: CircleAvatar(
                            radius: 34.r,
                            backgroundColor: Colors.white,
                            child: Obx(() => Icon(
                              controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
                              color: Colors.black,
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.captureAndDetect,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(60.r),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 54.r,
                              backgroundColor: AppColor.bgBtnCameraColor,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.pickImageFromGallery,
                          child: CircleAvatar(
                            radius: 34.r,
                            backgroundColor: AppColor.white,
                            child: const Icon(Icons.photo_camera, color: AppColor.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
