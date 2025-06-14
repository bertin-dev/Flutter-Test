import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_recruitment/presentation/home/widgets/custom_bottom_navbar.dart';

import '../historique/historique_view.dart';
import '../scan_card/scan_card_view.dart';
import '../ticket/ticket_view.dart';
import 'controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  static const String pageName = "/home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          switch (controller.currentIndex.value) {
            case 0:
              return const ScanCardView();
            case 1:
              return const TicketView();
            case 2:
              return const HistoriqueView();
            default:
              return const Center(child: Text("Compte"));
          }
        }),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
