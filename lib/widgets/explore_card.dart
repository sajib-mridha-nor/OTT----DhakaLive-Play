import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/custom_cashe_image.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({Key? key, this.onClick, this.title, this.img, this.clr})
      : super(key: key);
  final String? title;
  final String? img;
  final String? clr;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
        
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CustomCacheImage(
                imageUrl: "$img",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: HexColor(clr!).withOpacity(.7),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                title!,
                style: textTheme.headline6,
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
