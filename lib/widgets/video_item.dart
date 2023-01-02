import 'package:badges/badges.dart';
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/utils/palette.dart';
import 'package:dhakalive/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  final String? subtitle;
  final VoidCallback? onClick;
  final String? title;
  final double? height;
  final double? width;
  final String? imgUrl;
  final bool isPremium;

  const VideoItem(
      {Key? key,
      this.subtitle,
      this.height,
      this.width,
      this.onClick,
      this.title,
      this.imgUrl, this.isPremium = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Container(
      width: width ?? 300,
      height: height ?? 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onClick,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                "$imgUrl",
                height: height ?? 200,
                width: width ?? 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width ?? 300,
                  height: height ?? 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Palette.backgroundColor.withOpacity(0.95),
                          Palette.backgroundColor.withOpacity(0.8),
                          Palette.backgroundColor.withOpacity(0.05),
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "$title",
                          style: textTheme.labelLarge!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "6:16",
                              style: textTheme.caption!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Badge(
                              toAnimate: false,
                              shape: BadgeShape.square,
                              badgeColor: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(4),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 4),
                              badgeContent: Text(
                                isPremium ? 'PREMIUM' : 'FREE',
                                style: textTheme.caption,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Palette.backgroundColor.withOpacity(0.5),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 32,
                      color: Colors.white60,
                    ), // ,,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
