import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mini_app/config/theme/app_theme.dart';
import 'package:mini_app/localization/local_string.dart';
import 'package:mini_app/ui/detail_product_screen.dart';
import 'package:mini_app/ui/list_product_screen.dart';
import 'package:mini_app/ui/login_screen.dart';
import 'package:mini_app/ui/things_bought_screen.dart';
import 'package:mini_app/utils/firebase/login/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> configureApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      // locale: const Locale('en', 'US'),
      locale: Get.locale,
      //set ngôn ngữ theo mặc định của máy hoặc custimize thoe gần nhất được lưu
      // fallbackLocale: Locale('en', 'US'), // Ngôn ngữ dự phòng nếu ngôn ngữ của thiết bị không được hỗ trợ,
      title: 'hello'.tr,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeMode.dark, //currentThemeInApp if null value get system Theme
      home: LoaderOverlay(
        child: const ThingsBoughtScreen(),
        overlayWidgetBuilder: (_) {
          //ignored progress for the moment
          return const Center(
            child: SpinKitCubeGrid(
              color: Colors.red,
              size: 50.0,
            ),
          );
        },
      ),
    );
  }
}
