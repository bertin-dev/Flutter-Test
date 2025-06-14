import 'package:get/get.dart';
import 'package:test_recruitment/presentation/historique/historique_view.dart';
import 'package:test_recruitment/presentation/home/home_view.dart';
import 'package:test_recruitment/presentation/scan_card/scan_card_view.dart';

import '../presentation/splash/splash_view.dart';
import '../presentation/ticket/ticket_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashView()),
    GetPage(name: Routes.HOME, page: () => const HomeView()),
    GetPage(name: Routes.TICKET, page: () => const TicketView()),
    GetPage(name: Routes.SCANCARD, page: () => const ScanCardView()),
    GetPage(name: Routes.HISTORIQUE, page: () => const HistoriqueView()),
  ];
}