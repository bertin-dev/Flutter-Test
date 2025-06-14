import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../scan_card/controllers/scan_card_controller.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<ScanCardController>(() => ScanCardController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}