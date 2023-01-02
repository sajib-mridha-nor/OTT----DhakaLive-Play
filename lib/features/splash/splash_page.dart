import 'package:dhakalive/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2800), () {
      Get.to(MainPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff1592b),
        // height: double.infinity,
        // width: double.infinity,
        child: Center(
          child: Image.asset(
            "assets/tv_ac/Dhakalive-ott.gif",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
