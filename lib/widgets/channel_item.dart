import 'package:dhakalive/utils/palette.dart';
import 'package:flutter/material.dart';

class ChannelItem extends StatelessWidget {
  final VoidCallback? onClick;
  final String? title;
  final double? height;
  final double? width;
  final String? cover;
  final String? thumbnail;
  final bool isVerified;

  const ChannelItem(
      {Key? key,
      this.height,
      this.width,
      this.onClick,
      this.title,
      this.cover,
      this.thumbnail,
      this.isVerified = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return GestureDetector(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 251, 251, 251),
                  radius: 30.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("$thumbnail"),
                    radius: 28.0,
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     children: [
                //       TextSpan(
                //         text: "$title ",
                //         style: textTheme.labelLarge!,
                //       ),
                //       isVerified
                //           ? const WidgetSpan(
                //               child: Icon(Icons.verified, size: 12),
                //             )
                //           : const TextSpan(),
                //   ],
                // ),
                //   )
                // ],
                // ),
                // ),

                // Stack(
                //   children: <Widget>[
                //     ClipRRect(
                //       borderRadius: BorderRadius.circular(16.0),
                //       child: Image.network(
                //         "$cover",
                //         height: height ?? 200,
                //         width: width ?? 300,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     Positioned.fill(
                //       child: Align(
                //         alignment: Alignment.bottomCenter,
                //         child: Container(
                //           width: width ?? 300,
                //           height: height ?? 200,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(16.0),
                //             gradient: LinearGradient(
                //                 begin: Alignment.bottomCenter,
                //                 end: Alignment.topCenter,
                //                 colors: [
                //                   Palette.backgroundColor.withOpacity(0.95),
                //                   Palette.backgroundColor.withOpacity(0.8),
                //                   Palette.backgroundColor.withOpacity(0.05),
                //                 ]),
                //           ),
                //           child:
                //     ),
                //   ),
                // ),
                //   ],
                // ),
              ]),
        ));
  }
}

class ChannelCard extends StatelessWidget {
  final VoidCallback? onClick;
  final String? title;
  final double? height;
  final double? width;
  final String? cover;
  final String? thumbnail;
  final bool isVerified;

  const ChannelCard(
      {Key? key,
      this.height,
      this.width,
      this.onClick,
      this.title,
      this.cover,
      this.thumbnail,
      this.isVerified = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return GestureDetector(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        "$cover",
                        height: height ?? 150,
                        width: width ?? 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: width ?? 300,
                            height: height ?? 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Palette.backgroundColor.withOpacity(0.95),
                                    Palette.backgroundColor.withOpacity(0.8),
                                    Palette.backgroundColor.withOpacity(0.05),
                                  ]),
                            ),
                          )),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 251, 251, 251),
                              radius: 31.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("$thumbnail"),
                                radius: 28.0,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "$title ",
                                      style: textTheme.labelLarge!
                                          .copyWith(fontSize: 12),
                                    ),
                                    isVerified
                                        ? const WidgetSpan(
                                            child:
                                                Icon(Icons.verified, size: 12),
                                          )
                                        : const TextSpan(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
