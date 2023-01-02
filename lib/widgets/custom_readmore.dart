import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomReadmore extends StatefulWidget {
  CustomReadmore({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<CustomReadmore> createState() => _CustomReadmoreState();
}

class _CustomReadmoreState extends State<CustomReadmore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedSize(
          // curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 70),
            child: Html(data: widget.text, style: {
              "body": Style(
                color: Colors.white54,
                lineHeight: LineHeight.normal,
                fontSize: FontSize(11),
                margin: Margins.all(0),
                padding: EdgeInsets.all(4),
              )
            }),
          )),
      Align(
        alignment: Alignment.topLeft,
        child: isExpanded
            ? TextButton(
                // icon: const Icon(Icons.arrow_upward),
                child: const Text('Read less'),
                onPressed: () => setState(() => isExpanded = false))
            : TextButton(
                // icon: const Icon(Icons.arrow_downward),
                child: const Text('Read more'),
                onPressed: () => setState(() => isExpanded = true)),
      )
    ]);
  }
}
