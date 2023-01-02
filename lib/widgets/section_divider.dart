import 'package:dhakalive/utils/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  TextStyle? style;
  EdgeInsets? padding;
  SectionDivider(
      {Key? key, required this.onClick,this.padding, this.style, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Padding(
      padding: padding ??  EdgeInsets.only(top: 8, left: 8, right: 2, bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: style ??
                textTheme.bodyText2!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          // dense: true,
          GestureDetector(
            onTap: onClick,
            child: Row(
              children: [
                Text(
                  "View All",
                  style: TextStyle(color: HexColor("C1C1C1"), fontSize: 12),
                ),
                SizedBox(
                  width: 0,
                ),
                Icon(
                  CupertinoIcons.forward,
                  size: 15,
                  color: HexColor("C1C1C1"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
