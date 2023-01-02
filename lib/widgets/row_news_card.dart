import 'package:flutter/material.dart';

class RowNewsCard extends StatelessWidget {
  const RowNewsCard(
      {Key? key,
      this.time,
      this.onClick,
      this.caption,
      this.catagory,
      this.img,
      this.title})
      : super(key: key);

  final String? img;
  final String? title;
  final String? caption;
  final String? catagory;
  final String? time;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onClick,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                img ??
                    "https://images.unsplash.com/photo-1547683905-f686c993aae5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zmxvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                height: 100,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Chip(
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: -4),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        label: Text(catagory ?? "ব্রেকিং নিউজ",
                            style: textTheme.caption)),
                  ),
                  Text(
                    title ??
                        "আসামে বন্যায় মৃত্যু ৭০ জনের গৃহহীন ৩০ লাখের বেশি মানুষ",
                    style: textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 8,
                    width: 4,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      time ?? "১০ মিনিট আগে",
                      style: textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
