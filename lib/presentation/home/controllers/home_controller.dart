import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 3.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}