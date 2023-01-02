import 'package:dhakalive/core/network/dio_client.dart';
import 'package:dhakalive/features/auth/registration/otp_page.dart';
import 'package:dhakalive/features/auth/registration/registration_page.dart';
import 'package:dhakalive/features/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ProifileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  DioClient dioClient = DioClient.instance;
  GetStorage box = GetStorage();

  String? mobile;

  RxBool isLoading = false.obs;
  String? bearerToken;
  String? name;
  String? userName;
  String? profilePic;
  @override
  void onInit() {
    profile();
    // TODO: implement onInit
    super.onInit();
  }

  profile() async {
    try {
      final res = await dioClient.get(
        "auth/social/profile",
      );

      print("profilee res $res ");

      userName = res["data"]["name"];
      mobile = res["data"]["mobile"];
      saveProfile();

      // profilePic = res["data"]["profile_pic"];
    } catch (e) {
      print("getbearer error $e");
      return Future(() => e.toString());
    }
  }

  void saveProfile() {
    box.write("name", userName);
    box.write("mobile", mobile);
    // box.write("profilePic", profilePic);
  }
}
