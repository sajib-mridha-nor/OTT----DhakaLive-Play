import 'package:better_player/better_player.dart';
import 'package:dhakalive/features/content/byCategory/content_by_category_page.dart';
import 'package:dhakalive/features/content/byOrder/content_by_order_page.dart';
import 'package:dhakalive/features/content/rating_controller/rating_controller.dart';
import 'package:dhakalive/features/player/video_player.dart';
import 'package:dhakalive/features/player/youtube_player_page.dart';
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/custom_bootm_sheet.dart';
import 'package:dhakalive/widgets/custom_readmore.dart';
import 'package:dhakalive/widgets/section_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:readmore/readmore.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';

import 'single_content_controller.dart';

class SingleContentPage extends StatefulWidget {
  SingleContentPage({Key? key}) : super(key: key);

  @override
  State<SingleContentPage> createState() => _SingleContentPageState();
}

class _SingleContentPageState extends State<SingleContentPage> {
  final controller = Get.put(SingleContentController());

  final ratingController = Get.put(RatingController());

  double r = 0;

  // final videoPlayerController = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  // late ChewieController chewieController;

  // player(videoPlayerController) async {
  //   chewieController = ChewieController(
  //     videoPlayerController: videoPlayerController,
  //     autoPlay: true,
  //     looping: true,
  //     allowMuting: true,
  //     fullScreenByDefault: false,
  //     allowedScreenSleep: true,
  //     // hideControlsTimer: Duration(seconds: 1),
  //     showOptions: true,
  //     optionsTranslation: OptionsTranslation(
  //       playbackSpeedButtonText: 'Playback Speed',
  //       subtitlesButtonText: 'Subtitle',
  //       cancelButtonText: 'Close',
  //     ),
  // subtitle: Subtitles([
  //   Subtitle(
  //     index: 0,
  //     start: Duration.zero,
  //     end: const Duration(seconds: 10),
  //     text: 'Hello from subtitles',
  //   ),
  //   Subtitle(
  //     index: 1,
  //     start: const Duration(seconds: 10),
  //     end: const Duration(seconds: 20),
  //     text: 'Whats up? :)',
  //   ),
  // ]),
  // zoomAndPan: true
  // );

  // final playerWidget = Chewie(
  //   controller: chewieController!,
  // );
  // }

  @override
  void initState() {
    // player(VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
    // playVideo(context,
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    // TODO: implement initState
    super.initState();
  }

  int isPlay = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var visible = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      backgroundColor: const Color(0xff141415),
      body: controller.obx((content) {
        final state = content?.videos?[0];
        bool isExpanded = false;
        double rating = 5;
        var views = state?.views;
        var v = views == 1000
            ? "1k"
            : views == 2000
                ? "2k"
                : views.toString();

        return CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: false,
                leading: IconButton(
                  onPressed: (() {
                    Get.back();
                  }),
                  icon: CircleAvatar(
                    radius: 15,
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 18,
                    ),
                    backgroundColor: Colors.white60.withOpacity(.6),
                  ),
                ),
                floating: false,
                // backgroundColor: Color(0xFFEDF2F8),
                expandedHeight: 240,
                flexibleSpace: isPlay == 1
                    ? PlayVideo(
                        "https://dlc.ezzecloud.com/videos/68f86b96ea0cac41d6ce31a2277d433b/index.m3u8",
                        "${state?.images?.thumbnail}")
                    : isPlay == 2
                        ? PlayVideoYoutube("ZYzbalQ6Lg8")
                        : FlexibleSpaceBar(
                            background: Image.network(
                              "${state?.images?.thumbnail}",
                              height: 240,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )),
            SliverList(
              delegate: SliverChildListDelegate([
                // SizedBox(
                //   height: 200,
                //   child: Stack(
                //     children: [
                //       Visibility(
                //           visible: visible,
                //           child: Positioned.fill(
                //               child: Align(
                //             alignment: Alignment.center,
                //             child: Row(
                //               children: [
                //                 IconButton(
                //                     onPressed: () {},
                //                     icon: Icon(CupertinoIcons.play_arrow))
                //               ],
                //             ),
                //           ))),
                //       // GestureDetector(
                //       //     onTap: (() {
                //       //       setState(() {
                //       //         visible = !visible;
                //       //       });
                //       //     }),
                //       //     child: Chewie(controller: chewieController)),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 8, left: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 0, right: 4, left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "${state?.title}",
                                    style: textTheme.headline6
                                        ?.copyWith(fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: HexColor("FF5722").withOpacity(.9),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5.0, top: 5, left: 8, right: 8),
                                    child: Text(
                                      state?.isPremium == true
                                          ? "Premium"
                                          : "Free",
                                      style: textTheme.caption
                                          ?.copyWith(fontSize: 10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        HexColor("FF5722").withOpacity(.7)),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${state?.channel?.name}",
                                  style: textTheme.caption?.copyWith(
                                      fontSize: 11,
                                      color: Colors.white.withOpacity(.8)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        HexColor("FF5722").withOpacity(.7)),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${state?.meta?.duration}",
                                  style: textTheme.caption?.copyWith(
                                      fontSize: 11,
                                      color: Colors.white.withOpacity(.8)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        HexColor("FF5722").withOpacity(.7)),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${state?.releaseDate}",
                                  style: textTheme.caption?.copyWith(
                                      fontSize: 11,
                                      color: Colors.white.withOpacity(.8)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                CircleAvatar(
                                  radius: 5,
                                  // child: Icon(Icons.remove_red_eye),
                                  backgroundColor: Colors.white.withOpacity(.7),
                                  foregroundColor: Colors.black,
                                  backgroundImage:
                                      const AssetImage("assets/eye.png"),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${v}+",
                                  style: textTheme.caption?.copyWith(
                                      fontSize: 11,
                                      color: Colors.white.withOpacity(.8)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Html(data: "${state?.description}", style: {
                              "body": Style(
                                color: Colors.white54,
                                lineHeight: LineHeight.normal,
                                fontSize: FontSize(11),
                                margin: Margins.all(0),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                              )
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 3, // width: double.infinity,
                            child: SizedBox(
                              height: 60,
                              child: TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white.withOpacity(.6))),
                                  onPressed: () {
                                    setState(() {
                                      isPlay = 2;
                                    });
                                    // playYoutubeTrailer(
                                    //     context, "${content?.trailer}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.play_arrow,
                                          size: 32, color: Colors.white),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Trailer".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 4,
                            // width: double.infinity,
                            child: SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              HexColor("FF5722"))),
                                  onLongPress: () {
                                    setState(() {
                                      isPlay = 0;
                                    });
                                  },
                                  onPressed: () {
                                    setState(() {
                                      isPlay = 1;
                                    });
                                    // Navigator.push(
                                    // context,
                                    // MaterialPageRoute(
                                    //     builder: (_) => VideoScreen()));
                                    // Get.to(VideoScreen(
                                    //   url:
                                    //       "https://videodelivery.net/${state?.meta?.id}/manifest/video.m3u8",
                                    //   thumbnail: "${state?.images?.thumbnail}",
                                    // ));

                                    // setState(() {
                                    //   player(VideoPlayerController.network(
                                    //       "https://videodelivery.net/${state?.meta?.id}/manifest/video.m3u8"));
                                    // });
                                    // "https://dlc.ezzecloud.com/videos/68f86b96ea0cac41d6ce31a2277d433b/index.m3u8", dlc
                                    print(
                                        "https://videodelivery.net/${state?.meta?.id}/manifest/index.m3u8");
                                    // playVideo(
                                    //     context,
                                    //     "https://videodelivery.net/${state?.meta?.id}/manifest/video.m3u8",
                                    //     "${state?.images?.thumbnail}");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                          Icons.play_circle_outline_outlined,
                                          size: 26,
                                          color: Colors.white),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        state?.isPremium == true
                                            ? "Subscribe & Watch"
                                            : "Watch Now".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(state?.genres?.length ?? 0,
                              (index) {
                            final item = state?.genres?[index];
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      width: 1, color: Colors.white54)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.only(right: 8),
                              child: Text(
                                "${item?.name}",
                                style: textTheme.caption?.copyWith(
                                    fontSize: 11,
                                    // fontWeight: FontWeigh,
                                    color: Colors.white54),
                              ),
                            );
                          }),
                        ),
                      ),

                      // Text(
                      //   "Genres",
                      //   style: textTheme.labelLarge,
                      // ),

                      const SizedBox(
                        height: 16,
                      ),

                      // Text(
                      //   "Rating",
                      //   style: textTheme.bodyText2!.copyWith(
                      //       fontSize: 14, fontWeight: FontWeight.w600),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Center(
                      //       child: RatingBar.builder(
                      //         initialRating: 3.5,
                      //         minRating: 1,
                      //         direction: Axis.horizontal,
                      //         allowHalfRating: true,
                      //         itemCount: 5,
                      //         itemPadding: const EdgeInsets.all(2.0),
                      //         itemBuilder: (context, _) => SizedBox(
                      //           // height: 50,
                      //           width: 40,
                      //           child: Icon(
                      //             Icons.star,
                      //             // size: 10,
                      //             color: HexColor("F6E1A6"),
                      //           ),
                      //         ),
                      //         onRatingUpdate: (t) {},
                      //       ),
                      //     ),
                      //     // SizedBox(
                      //     //   width: 16,
                      //     // ),
                      //     // GestureDetector(
                      //     //   onTap: () {
                      //     //     ratingBootmSheet(context, (t) {
                      //     //       rating = t;
                      //     //     }, () {
                      //     //       ratingController.ratingVideo(
                      //     //           rating, content?.id, content?.type);
                      //     //       Navigator.pop(context);
                      //     //     });
                      //     //   },
                      //     //   child: Image.asset(
                      //     //     "assets/add.png",
                      //     //     color: HexColor("F6E1A6"),
                      //     //     height: 30,
                      //     //     width: 30,
                      //     //   ),
                      //     // )
                      //   ],
                      // ),

                      // ElevatedButton(
                      //     style: ButtonStyle(
                      //         backgroundColor: MaterialStateProperty.all(
                      //             Theme.of(context).cardColor)),
                      //     onPressed: () {
                      //       controller.ratingVideo();
                      //       // ratingBootmSheet(context, (t) {
                      //       //   print(t);

                      //       //   r = t;
                      //       // }, () {
                      //       //   controller.ratingVideo();
                      //       //   Navigator.pop(context);
                      //       // });
                      //     },
                      //     child: const Text("Submitted")),

                      // const SizedBox(
                      //   height: 8,
                      // ),

                      if (state?.casts?.length != 0)
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Casts: ",
                                  style: textTheme.bodyText2!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 280,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                          state?.casts?.length ?? 0, (index) {
                                        final item = state?.casts?[index];
                                        List url = [
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIaBsasz4dq2b7OzzO6jquEXJxYMgULU05Q&usqp=CAU",
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lKjxY7lEHe5IUGFbiFwSOjSC_nq7FtOw_g&usqp=CAU",
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe1UfuDQdBBFZA7SmZqc6wr7onOV6R1SW-ww&usqp=CAU",
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIaBsasz4dq2b7OzzO6jquEXJxYMgULU05Q&usqp=CAU",
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lKjxY7lEHe5IUGFbiFwSOjSC_nq7FtOw_g&usqp=CAU",
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe1UfuDQdBBFZA7SmZqc6wr7onOV6R1SW-ww&usqp=CAU"
                                        ];

                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: CircleAvatar(
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 22,
                                              backgroundImage: NetworkImage(
                                                  item?.profilePicture ??
                                                      url[index]),
                                            ),
                                            backgroundColor: Colors.white,
                                            radius: 23,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),

                      Row(
                        children: [
                          Text(
                            "Categories: ",
                            style: textTheme.bodyText2!.copyWith(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 30,
                            width: 250,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    state?.categories?.length ?? 0, (index) {
                                  final item = state?.categories?[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => ContentByCategoryPage(
                                              isPortrait: false,
                                              title: item!.name!),
                                          arguments: {"slug": item!.slugEn!});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                              width: 1, color: Colors.white54)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        "${item?.name}",
                                        style: textTheme.caption?.copyWith(
                                            fontSize: 11,
                                            // fontWeight: FontWeigh,
                                            color: Colors.white54),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Wrap(
                      //   children: List.generate(state?.categories?.length ?? 0,
                      //       (index) {
                      //     final item = state?.categories?[index];
                      //     return Padding(
                      //         padding: const EdgeInsets.only(right: 8),
                      //         child: ActionChip(
                      //           label: Text("${item?.name}"),
                      //           onPressed: () {
                      //             Get.to(
                      //                 () => ContentByCategoryPage(
                      //                     title: item!.name!),
                      //                 arguments: {"slug": item!.slugEn!});
                      //           },
                      //         ));
                      //   }),
                      // ),
                      const SizedBox(
                        height: 8,
                      ),
                      SectionDivider(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        style: textTheme.bodyText2!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        title:
                            "Related Contents  [${content?.relatedContent?.length}]",
                        onClick: () {
                          Get.to(
                              () => ContentByOrderPage(
                                    isPortrait: true,
                                    title: "Related Contents",
                                  ),
                              arguments: {"orderBy": "latest"});
                        },
                      ),

                      Container(
                        // color: Colors.amber,
                        height: 120,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = content?.relatedContent?[index];
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          () => ContentByOrderPage(
                                                isPortrait: true,
                                                title: "Related Contents",
                                              ),
                                          arguments: {"orderBy": "latest"});
                                      // if (item.type == "SINGLE") {
                                      //   Get.to(() => SingleContentPage(),
                                      //       arguments: {"id": item.id});
                                      // }
                                      // if (item.type == "PLAYLIST") {
                                      //   Get.to(() => PlaylistContentPage(),
                                      //       arguments: {"id": item.id});
                                      // }
                                      // if (item.type == "SERIES") {
                                      //   Get.to(() => SeriesContentPage(),
                                      //       arguments: {"id": item.id});
                                      // }
                                    },
                                    child: Container(
                                      width: 160,
                                      padding: EdgeInsets.only(
                                          left: 0,
                                          right: index ==
                                                  content
                                                      ?.relatedContent?.length
                                              ? 8
                                              : 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  "${item?.images?.thumbnail}",
                                                  height: 90,
                                                  width: 160,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              // Positioned.fill(
                                              //   child: Align(
                                              //     alignment: Alignment.bottomCenter,
                                              //     child: Container(
                                              //       height: 90,
                                              //       width: double.infinity,
                                              //       decoration: BoxDecoration(
                                              //           gradient: LinearGradient(
                                              //               begin:
                                              //                   Alignment.topCenter,
                                              //               end: Alignment
                                              //                   .bottomCenter,
                                              //               colors: [
                                              //             Colors.transparent,
                                              //             Colors.transparent,
                                              //             Colors.black,
                                              //           ])),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "${item?.title}",
                                            style: textTheme.displayLarge
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              );
                            },
                            itemCount: content?.relatedContent?.length),
                      ),

                      // Container(
                      //   height: 160,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (context, index) {
                      //         final item = content?.relatedContent?[index];
                      //         return GestureDetector(
                      //           onTap: () {
                      //             print("object");

                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: ((context) =>
                      //                         SingleContentPage())));
                      //             Get.to(() => SingleContentPage(),
                      //                 arguments: {"id": item?.id});
                      //           },
                      //           child: Container(
                      //             width: 200,
                      //             padding: const EdgeInsets.only(
                      //               left: 8,
                      //               // right: index == state.length - 1
                      //               // ? 8
                      //               // : 0
                      //             ),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //                 ClipRRect(
                      //                   borderRadius:
                      //                       BorderRadius.circular(8.0),
                      //                   child: Image.network(
                      //                     "${item?.images?.thumbnail}",
                      //                     height: 130,
                      //                     width: 200,
                      //                     fit: BoxFit.cover,
                      //                   ),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 4,
                      //                 ),
                      //                 Text(
                      //                   "${item?.title}",
                      //                   style: textTheme.displayLarge?.copyWith(
                      //                     fontSize: 14,
                      //                   ),
                      //                   overflow: TextOverflow.ellipsis,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //       itemCount: content?.relatedContent?.length),
                      // ),
                    ],
                  ),
                )
              ]),
            )
          ],
        );
      }),
    );
  }

  AspectRatio PlayVideo(url, thumbnail) {
    return AspectRatio(
      aspectRatio: 5 / 5,
      child: BetterPlayer.network(url,
          betterPlayerConfiguration: BetterPlayerConfiguration(
              aspectRatio: 5 / 5,
              placeholder: Image.network(
                thumbnail,
                // height: 200,

                // width: double.infinity,
                fit: BoxFit.cover,
              ),
              autoPlay: true,
              // aspectRatio: 16 / 12,
              fullScreenByDefault: false,
              expandToFill: true)),
    );
  }
}

AspectRatio PlayVideoYoutube(
  url,
) {
  return AspectRatio(
      aspectRatio: 5 / 5,
      child: YoutubePlayerPage(
        url: url,
      ));
}

void playYoutubeTrailer(BuildContext context, String url) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.8),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Center(
        child: YoutubePlayerPage(
          url: url,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

void playVideo(BuildContext context, String url, thumbnail) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.9),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: BetterPlayer.network(url,
              betterPlayerConfiguration: BetterPlayerConfiguration(
                  placeholder: Image.network(
                    thumbnail,
                    // height: 200,
                    // width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  autoPlay: true,
                  // aspectRatio: 16 / 12,
                  fullScreenByDefault: true,
                  expandToFill: true)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
