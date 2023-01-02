import 'package:flutter/material.dart';

class T extends StatelessWidget {
  const T({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
