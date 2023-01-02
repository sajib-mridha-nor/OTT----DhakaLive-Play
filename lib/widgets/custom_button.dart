import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class CustomButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onClick;
  final String title;

  const CustomButton(
      {Key? key,
      this.loading = false,
      required this.onClick,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        primary: Colors.transparent,
        shadowColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: loading == true ? null : onClick,
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.orange]),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(minWidth: 88.0),
          child: loading == false
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                )
              : const Center(
                  child: SizedBox(
                      width: 26,
                      height: 26,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      )),
                ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final bool? loading;
  final VoidCallback? onClick;
  final String title;
  final TextStyle? titleStyle;

  const SubmitButton(
      {Key? key,
      this.loading = false,
      this.onClick,
      required this.title,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        onPressed: onClick,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: loading == true
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: titleStyle ?? const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton(
      {Key? key,
      required this.buttontype,
      this.img,
      required this.onClick,
      required this.title})
      : super(key: key);
  final SocialLoginButtonType buttontype;
  final String title;
  final VoidCallback onClick;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: SocialLoginButton(
        backgroundColor: Colors.white.withOpacity(0),
        buttonType: buttontype,
        borderRadius: 20,
        imageWidth: 20,
        height: 40,
        imagePath: img,
        text: title,
        textColor: Colors.white,
        onPressed: onClick,
      ),
    );
  }
}
