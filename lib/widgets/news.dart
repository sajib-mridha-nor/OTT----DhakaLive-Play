import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../utils/palette.dart';
import '../../widgets/custom_cashe_image.dart';

class NewsCard extends StatelessWidget {
  var onPress;
  var index;


  NewsCard({Key? key, this.index, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: InkWell(onTap: onPress,
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Container(
                height: 70,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomCacheImage(
                       imageUrl: 'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
                  
          
                    )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dahak live limited launch OTT Platform on june 25",
                      maxLines: 2,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Read More',
                              style: TextStyle(
                                color: Palette.readmoreClr,
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.read_more,
                              color: Palette.readmoreClr,
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.timelapse,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "19 oct 2022",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
