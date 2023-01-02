
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/utils/palette.dart';
import 'package:dhakalive/widgets/custom_dropdown.dart';
import 'package:dhakalive/widgets/episode_content.dart';

import 'package:dhakalive/widgets/section_divider.dart';
import 'package:dhakalive/widgets/video_item.dart';
import 'package:flutter/material.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  bool isRelease = true;
  bool ispremium = false;

  var season = 0;
  var suscription = ["Free", "premium"];

  List genre = ["Drama", "Romantic", "Action", "comedy"];
  var img = [
    "https://images.unsplash.com/photo-1593489062665-9f26fa627d73?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGluZGlhbiUyMGFjdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1534569370043-e0af197b3ec0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwYWN0b3J8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1606214443822-7997abf29104?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGluZGlhbiUyMGFjdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1570212773364-e30cd076539e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aW5kaWFuJTIwYWN0cmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
        appBar: AppBar(
          title: const Text("SeriesPage"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1595495529106-adb18dfe16a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHR2JTIwc2VyaWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Palette.backgroundColor.withOpacity(0.6),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.01),
                          ]),
                    ),
                  ),
                )),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.black87.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.star,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "6.5",
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
                        style: textTheme.headlineSmall!
                            .copyWith(color: HexColor("#EDE0DD")),
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: HexColor("#53433F"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(
                              ispremium ? "Free" : "Premium",
                              style: TextStyle(
                                  color: HexColor("#EDE0DD"), fontSize: 13),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
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
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Short Film",
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: HexColor("#F6E1A6"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "12" ' +',
                        style:
                            TextStyle(color: HexColor("#E7BDB2"), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Season 1",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  isRelease == false
                      ? Text(
                          "Released on: 14 April 2022",
                          style: textTheme.titleMedium,
                        )
                      : Container(),
                  const SizedBox(
                    height: 8,
                  ),
                  isRelease == false
                      ? Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(double.maxFinite, 40)),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 238, 58, 8)),
                              ),
                              onPressed: () {
                                setState(() {
                                  isRelease = true;
                                });
                              },
                              label: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  "Watch Trailler",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                              )),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(double.maxFinite, 40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 238, 58, 8))),
                                  onPressed: () {
                                    setState(() {
                                      isRelease = isRelease != true;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      ispremium
                                          ? 'Watch Now'
                                          : 'Subscribe & Watch',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                                  )),
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
                                    backgroundColor: MaterialStateProperty.all(
                                        Palette.backgroundColor),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "Watch Trailler",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.playlist_add,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Add to list"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.file_download_outlined,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Download"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.share,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Share"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                      text: TextSpan(
                          text:
                              "Lorem ipsum dolor est sit amet, consectetur adipiscing elit. Euismod risus, nunc etiam education dolor, tempus quam dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          style: textTheme.labelLarge,
                          children: [
                        TextSpan(
                            text: " See More",
                            style: TextStyle(color: HexColor("#E7BDB2")))
                      ])),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Genre", style: textTheme.titleLarge),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    width: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          color: HexColor("#53433F"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(
                              genre[index],
                              style: TextStyle(
                                  color: HexColor("#EDE0DD"), fontSize: 13),
                            ),
                          )),
                      itemCount: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Cast", style: textTheme.titleLarge),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 80,
                    width: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(img[index]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(genre[index]),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                      itemCount: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Text(
                  //   "Download All Seasons ",
                  //   style: textTheme.titleMedium,
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdown(
                      items: const ["Season 1", "Season 2", "Season 3"],
                      onChange: (t) {
                        if (t!.contains("Season 1")) {
                          setState(() {
                            season = 2;
                          });
                        } else if (t.contains("Season 2")) {
                          setState(() {
                            season = 7;
                          });
                        } else if (t.contains("Season 3")) {
                          setState(() {
                            season = 10;
                          });
                        }
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => EpisodeContent(
                            onPress: null,
                          ),
                      itemCount: season),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Ratting", style: textTheme.titleLarge),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 60,
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
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: HexColor("#5D3F37"),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 16, right: 16),
                      child: InkWell(
                          splashColor: Colors.amber,
                          onTap: () {},
                          child: const Text("Submit",
                              style: TextStyle(fontSize: 18))),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SectionDivider(onClick: () {}, title: "Recommanded"),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const VideoItem(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1634328946963-0fc71a190ab9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGluZGlhbiUyMHR2JTIwc2VyaWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                              width: 280,
                              height: 130,
                              title: "Golden jubilee Concert Live",
                            ),
                        itemCount: 5),
                  ),
                  SectionDivider(onClick: () {}, title: "Most Propular"),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const VideoItem(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1653127056092-4a418749a818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwdHYlMjBzZXJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                              width: 200,
                              height: 130,
                              title: "Golden jubilee Concert Live",
                            ),
                        itemCount: 5),
                  ),
                  SectionDivider(onClick: () {}, title: "Recently Added"),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => const VideoItem(
                              imgUrl:
                                  "https://images.unsplash.com/photo-1655185495666-79263d7f278d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                              width: 200,
                              height: 130,
                              title: "Golden jubilee Concert Live",
                            ),
                        itemCount: 5),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}




   // Container(
                  //   height: 600,
                  //   width: double.infinity,
                  //   child: DefaultTabController(
                  //     length: 3,
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         TabBar(
                  //           indicatorColor: Colors.red,
                  //           tabs: const [
                  //             Tab(
                  //               text: "Episode",
                  //             ),
                  //             Tab(
                  //               text: "Overview",
                  //             ),
                  //             Tab(
                  //               text: "More like this",
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(
                  //           height: 5,
                  //         ),
                  //         SizedBox(
                  //           width: 130,
                  //           child: CustomDropdown(
                  //               label: "Season 1",
                  //               items: ["Season 1", "Season 2", "Season 3"],
                  //               hint: "Season 1",
                  //               onChange: (t) {}),
                  //         ),
                  //         const SizedBox(
                  //           height: 5,
                  //         ),
                  //         Expanded(
                  //           child: TabBarView(
                  //             children: [
                  //               Container(
                  //                 height: 130,
                  //                 child: ListView.builder(
                  //                     physics: NeverScrollableScrollPhysics(),
                  //                     scrollDirection: Axis.vertical,
                  //                     shrinkWrap: true,
                  //                     itemBuilder: (context, index) =>
                  //                         EpisodeContent(
                  //                           onPress: null,
                  //                         ),
                  //                     itemCount: 5),
                  //               ),
                  //               GestureDetector(
                  //                 onTap: () {
                  //                   // Get.to(() => GuestProfilePage());
                  //                 },
                  //                 child: const Center(
                  //                     child: Text(
                  //                         "For Add Watch_list Please login")),
                  //               ),
                  //               Center(
                  //                   child: Text(
                  //                       "For Add Watch_list Please login")),
                  //               // Icon(Icons.directions_car, size: 350),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
