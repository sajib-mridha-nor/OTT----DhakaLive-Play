import 'package:dhakalive/features/auth/auth_controller.dart';
import 'package:dhakalive/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:social_login_buttons/social_login_buttons.dart';

class RegitrationPage extends StatelessWidget {
  RegitrationPage({Key? key}) : super(key: key);
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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter your name",
                        contentPadding: EdgeInsets.only(top: 16),

                        // fillColor: Colors.grey,
                        focusColor: Colors.grey),
                    onChanged: (t) {
                      controller.name = t;
                      debugPrint(controller.name);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name ';
                      }
                      return null;
                    },
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
                          controller.userRegistration();
                        },
                  title: "continue",
                  // loading: controller.isLoading
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
