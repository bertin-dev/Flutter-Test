import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_recruitment/presentation/splash/bindings/splash_binding.dart';
import 'package:test_recruitment/routes/app_pages.dart';
import 'package:test_recruitment/theme/app_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit (
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'ViewerX',
          initialBinding: SplashBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system
        );
      }
    );
  }
}
