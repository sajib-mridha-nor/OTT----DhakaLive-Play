import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/features/content/model/content_details_responsee.dart';
import 'package:dhakalive/features/splash/splash_page.dart';

import 'package:dhakalive/test/player.dart';
import 'package:dhakalive/theme/dhakaLive_theme.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await AppPathProvider.initPath();
  // VideoJsResults().init();

  //initial controller
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DhakaLive',
      debugShowCheckedModeBanner: false,
      theme: DhakaLiveTheme.lightTheme(),
      darkTheme: DhakaLiveTheme.darkTheme(),
      themeMode: ThemeMode.dark,
      home: const SplashPage(),
    );
  }
}
