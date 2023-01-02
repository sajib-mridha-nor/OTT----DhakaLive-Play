import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../utils/palette.dart';
import '../../widgets/custom_cashe_image.dart';

class EpisodeContent extends StatelessWidget {
  var onPress;
  var onDownload;
  final img;
  final epTitle;
  final epDuration;

  EpisodeContent(
      {Key? key,
      this.onDownload,
      this.epDuration,
      this.epTitle,
      this.img,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: InkWell(
                onTap: onPress,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            img ??
                                'https://images.unsplash.com/photo-1530090382228-7195e08d7a75?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhcmslMjB0diUyMHNlcmllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                            fit: BoxFit.cover,
                            height: 70,
                            width: 120,
                          )),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  Palette.backgroundColor.withOpacity(0.5),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 16,
                                color: Colors.white60,
                              ), // ,,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    epTitle ?? "EP#1 | Febu in the Office",
                                    maxLines: 2,
                                    style: textTheme.subtitle2,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    epDuration ?? '23 : 32',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 11,
                                   
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: onDownload,
                                  icon: Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white,
                                  ))
                            ],
                          )))
                ]))));
  }
}
