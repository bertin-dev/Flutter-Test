import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_recruitment/theme/app_color.dart';

import '../../common/widgets/loader.dart';
import '../home/home_view.dart';
import 'controllers/splash_controller.dart';


class SplashView extends StatelessWidget {
  SplashView({super.key});
  static const String pageName = "/";
  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Obx(() {
          if(splashController.isLoading.value){
            return const Center(child: Loader(),);
          } else{
            return AnimatedSplashScreen(
                duration: 3000,
                splash: const Image(image: AssetImage('assets/images/logo.png')),
                nextScreen: const HomeView(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: AppColor.primaryColor
            );
          }
        })
    );
  }

}