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

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  DioClient dioClient = DioClient.instance;
  GetStorage box = GetStorage();

  String? verifyId;
  int? sendToken;
  String? phoneNumber;
  String? smsCode;

  RxBool isLoading = false.obs;
  String? bearerToken;
  String? name;
  String? userName;
  String? authToken;

  void profile() async {
    try {
      final res = await dioClient.get(
        "auth/social/profile",
      );

      print("profilee res $res ");

      userName = res["data"]["name"];
      userName = res["data"]["phonenumber"];
    } catch (e) {
      print("getbearer error $e");
      return Future(() => e.toString());
    }
  }

  Future<String> getBearerToken({String? token}) async {
    try {
      final res = await dioClient
          .post("auth/social/login", data: {"token": token.toString()});

      print("for bearer res $res ");

      return Future(() => res["data"]["token"]);
    } catch (e) {
      print("getbearer error $e");
      return Future(() => e.toString());
    }
  }

  Future<String> logoutServer() async {
    try {
      final res = await dioClient.post(
        "auth/social/logout",
      );

      print("logout res $res ");

      return Future(() => res["message"]);
    } catch (e) {
      print("logout error $e");
      return Future(() => e.toString());
    }
  }

  userRegistration() async {
    if (bearerToken == "User Not Found") {
      isLoading(true);
      try {
        isLoading(true);
        final res = await dioClient.post("auth/social/register",
            data: {"token": authToken.toString(), "name": name.toString()});

        print("reg bearer res $res ");

        saveBearerToken(token: res["data"]["token"]);
        Get.to(MainPage());
        isLoading(false);
      } catch (e) {
        Get.to(MainPage());
        isLoading(false);

        print(e.toString());
      }
    } else {
      return null;
    }
  }

  void verifyPhoneNumber() async {
    isLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          debugPrint('The provided phone number is not valid.');
        } else {
          debugPrint("$e");
        }
        Get.snackbar("invalid-phone-number", "Please check your phone number");
        isLoading(false);
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("visms $verificationId");
        verifyId = verificationId;
        sendToken = resendToken;
        Get.snackbar("OTP Send your phone", "Please check your phone");

        Get.to(OTPPage());
        isLoading(false);

        // Create a PhoneAuthCredential with the code
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("cartr$verificationId");
      },
    );
  }

  void resendOtp() async {
    isLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: sendToken,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        isLoading(false);
        Get.snackbar("Try againg", "Verification Failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("for bearer res $resendToken ");
        Get.snackbar("Againg OTP Send your phone", "Please check your phone");
        isLoading(false);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    try {
      isLoading(true);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId.toString(), smsCode: smsCode.toString());

      // Sign the user in (or link) with the credential
      final userCredential = await auth.signInWithCredential(credential);

      authToken = await userCredential.user?.getIdToken();

      print("firebase token $authToken");
      bearerToken = await getBearerToken(token: authToken);

      print("object");

      if (bearerToken == "User Not Found") {
        Get.to(RegitrationPage());

        isLoading(false);
      } else if (bearerToken != "User Not Found") {
        print("not null bearerr token $bearerToken");

        saveBearerToken(token: bearerToken.toString());
        Get.snackbar("Succesfully login", "Welcome to Dhaka Live OTT");
        Get.to(MainPage());
        isLoading(false);
      }

      //save token

      debugPrint("$bearerToken");
      isLoading(false);
    } catch (e) {
      isLoading(false);
      debugPrint("error is : $e");
    }
  }

  void saveBearerToken({required String token}) {
    box.write("jwt", token);
  }

  void allLogout() async {
    try {
      final logoutStatus = await logoutServer();
      Get.snackbar(logoutStatus, "");
      await auth.signOut();
      box.erase();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
