import 'package:country_code_picker/country_code_picker.dart';
import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/features/auth/registration/registration_page.dart';
import 'package:dhakalive/utils/palette.dart';
import 'package:dhakalive/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  String countryCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                ),
                SizedBox(
                    height: 100,
                    width: 300,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Continue with Phone",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "01XXXXXXXXX",
                        contentPadding: const EdgeInsets.only(top: 16),
                        prefixIcon: CountryCodePicker(
                          dialogBackgroundColor: Palette.backgroundColor,
                          dialogTextStyle: const TextStyle(color: Colors.white),
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          onChanged: (t) {
                            countryCode = t.toString();

                            print(t);
                          },
                          onInit: (value) {
                            countryCode = '+880';
                          },
                          initialSelection: 'BD',
                          favorite: const ['+880', 'bd'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        // fillColor: Colors.grey,
                        focusColor: Colors.grey),
                    onChanged: (t) {
                      if (t.length == 10) {
                        controller.phoneNumber = countryCode + t;
                        print(controller.phoneNumber);
                      } else if (t.length == 11) {
                        print(t);
                        controller.phoneNumber = "+88$t";
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length < 10 ||
                          value.length > 11) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SubmitButton(
                    onClick: controller.isLoading.value == true
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              controller.verifyPhoneNumber();
                            }
                            debugPrint(controller.phoneNumber);
                            print(countryCode);

                            // Get.to(OTPPage());
                          },
                    title: "Login",
                    loading: controller.isLoading.value),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                        child: Divider(
                      color: Colors.white38,
                      thickness: 1,
                      height: 1,
                      endIndent: 10,
                    )),
                    Text(
                      "or",
                      // style: TextStyle(color: Colors.red),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.white38,
                      thickness: 1,
                      height: 1,
                      indent: 10,
                      // endIndent: 10,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SocialButton(
                  buttontype: SocialLoginButtonType.google,
                  title: "Continue with Google",
                  onClick: () {
                    Get.to(RegitrationPage());
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SocialButton(
                  buttontype: SocialLoginButtonType.facebook,
                  title: "Continue with Facebook",
                  onClick: () {},
                ),
                const SizedBox(
                  height: 16,
                ),
                // SocialButton(
                //   buttontype: SocialLoginButtonType.apple,
                //   title: "Continue with Apple ID",
                //   onClick: () {},
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // SocialButton(
                //   buttontype: SocialLoginButtonType.microsoft,
                //   title: "Continue with Email",
                //   // img: "assets/email.png",
                //   onClick: () {},
                // ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Read Privacy Policy and Trams, Condition",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
