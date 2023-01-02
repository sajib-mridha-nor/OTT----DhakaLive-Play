import 'dart:ui';

import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/section_divider.dart';
import 'package:dhakalive/widgets/video_item.dart';
import 'package:flutter/material.dart';

class ChennalVideoPage extends StatelessWidget {
  ChennalVideoPage({
    Key? key,
  }) : super(key: key);
  var title = "DhakaLive Original";

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        title,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Player section
            Container(
              child: ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  "assets/live.png",
                  fit: BoxFit.cover,
                  height: 230,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ), //#E7BDB2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breakup with Febu",
                        style:
                            TextStyle(color: HexColor("#EDE0DD"), fontSize: 22),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 13,
                            color: HexColor("#F6E1A6"),
                          ),
                          Text(
                            "6.5",
                            style: TextStyle(
                                color: HexColor("#EDE0DD"), fontSize: 13),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "23:56" "  Min",
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Short Film", //
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "12" ' +', //
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.play_circle,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                const Size(double.maxFinite, 40)),
                            // maximumSize: MaterialStateProperty.all(Size.infinite),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 238, 58, 8))),
                        onPressed: () {},
                        label: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Watch Live',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/dliveicon.png",
                        height: 22,
                        width: 22,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "DhakaLive",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.verified,
                        size: 17,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.playlist_add,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.file_download_outlined,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  RichText(
                      text: TextSpan(
                          text:
                              "Lorem ipsum dolor est sit amet, consectetur adipiscing elit. Euismod risus, nunc etiam education dolor, tempus quam dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          children: [
                        TextSpan(
                            text: " See More",
                            style: TextStyle(color: HexColor("#E7BDB2")))
                      ])),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Ratting",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 63,
                    // width: 358,
                    color: Colors.grey.withOpacity(.2),
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Icon(
                            Icons.star,
                            size: 24,
                            color: HexColor("#F6E1A6"),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Icon(
                            Icons.star,
                            size: 24,
                            color: HexColor("#F6E1A6"),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Icon(
                            Icons.star,
                            size: 24,
                            color: HexColor("#F6E1A6"),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Icon(
                            Icons.star,
                            size: 24,
                            color: HexColor("#F6E1A6"),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    // height: 38,
                    // color: HexColor("#5D3F37"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: HexColor("#5D3F37"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 16, right: 16),
                      child: InkWell(
                          splashColor: Colors.amber,
                          onTap: () {
                            print("object");
                          },
                          child: const Text("Submit",
                              style: const TextStyle(fontSize: 18))),
                    ),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  SectionDivider(onClick: () {}, title: "Recommanded"),
                  Container(
                    height: h * .28,
                    // width: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => VideoItem(
                              width: 280,
                              title: "Golden jubilee Concert Live",
                            ),
                        itemCount: 5),
                  ),
                  SectionDivider(onClick: () {}, title: "Most Propular"),
                  Container(
                    height: h * .28,
                    // width: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => VideoItem(
                              width: 280,
                              title: "Golden jubilee Concert Live",
                            ),
                        itemCount: 5),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
