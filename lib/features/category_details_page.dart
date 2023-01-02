import 'package:dhakalive/widgets/play_able_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryDetailsPage extends StatelessWidget {
  final  String? titile;
   CategoryDetailsPage({Key? key, this.titile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          title:  Text(
            titile??"Web Series",
          )),
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
              PlayAbleContent(),
            ],
          ),
        ),
      ),
    );
  }
}
