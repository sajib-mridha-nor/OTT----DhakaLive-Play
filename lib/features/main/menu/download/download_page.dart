import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/utils/palette.dart';
import 'package:dhakalive/widgets/play_able_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PlayAbleContent(),
              const SizedBox(
                height: 8,
              ),
              PlayAbleContent(),
              const SizedBox(
                height: 8,
              ),
              PlayAbleContent()
            ],
          ),
        ),
      ),
    );
  }
}
