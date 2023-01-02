import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/features/auth/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePageV1 extends StatelessWidget {
  ProfilePageV1({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text("Login With Phonenumber")),
            ElevatedButton(
                onPressed: () {
                  authController.allLogout();
                },
                child: Text("Logout")),
            ElevatedButton(
                onPressed: () {
                  box.read("jwt");

                  print(box.read("jwt"));
                },
                child: Text("jwt")),
            ElevatedButton(
                onPressed: () {
                  authController.profile();
                  print(box.read("jwt"));
                },
                child: Text("jwt")),
          ],
        ),
      ),
    );
  }
}
