import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomPageScreen extends StatefulWidget {
  const CustomPageScreen({Key? key}) : super(key: key);

  @override
  State<CustomPageScreen> createState() => _CustomPageScreenState();
}

class _CustomPageScreenState extends State<CustomPageScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "1/5 steps completed",
              style: textTheme.bodyMedium,
            ),
            SizedBox(
              height: 8,
            ),
            LinearPercentIndicator(
                lineHeight: 6.0,
                percent: 0.5,
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey,
                progressColor: Colors.green,
                barRadius: Radius.circular(16))
          ],
        ),
      ),
    );
  }
}
