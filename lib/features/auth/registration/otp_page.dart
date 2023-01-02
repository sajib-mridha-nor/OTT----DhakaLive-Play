import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:social_login_buttons/social_login_buttons.dart';

class OTPPage extends StatelessWidget {
  OTPPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                ),
                Container(

                    // alignment: Alignment.center,
                    height: 46,
                    width: 233,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Enter OTP Code",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 2, right: 2),
                  child: PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.grey,
                        activeColor: Colors.grey,
                        selectedColor: Colors.black,
                        selectedFillColor: Colors.black,
                        inactiveColor: Colors.grey,
                        inactiveFillColor: Colors.grey),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                      // controller.smsCode = v;
                      print(controller.smsCode);
                      controller.verifyOTP();
                    },
                    onChanged: (value) {
                      controller.smsCode = value;
                      // print("hh ${controller.smsCode}");
                      // print(value);
                      // setState(() {
                      //   // smsCode = value;

                      // });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  loading: controller.isLoading.value,
                  onClick: controller.isLoading.value == true
                      ? null
                      : () {
                          controller.verifyOTP();
                        },
                  title: "Confirm",
                  // loading: controller.isLoading
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 320,
                  child: InkWell(
                    onTap: controller.isLoading.value == true
                        ? null
                        : () {
                            controller.resendOtp();
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Resend OTP Code",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
