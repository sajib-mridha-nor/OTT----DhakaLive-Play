import 'package:better_player/better_player.dart';
import 'package:dhakalive/features/content/byOrder/content_by_order_page.dart';
import 'package:dhakalive/features/content/rating_controller/rating_controller.dart';
import 'package:dhakalive/features/content/series/series_content_controller.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:dhakalive/features/player/youtube_player_page.dart';
import 'package:dhakalive/widgets/custom_dropdown.dart';
import 'package:dhakalive/widgets/custom_readmore.dart';
import 'package:dhakalive/widgets/section_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/hexcolor.dart';
import '../../../widgets/custom_bootm_sheet.dart';

class SeriesContentPage extends StatelessWidget {
  SeriesContentPage({Key? key}) : super(key: key);

  final controller = Get.put(SeriesContentController());
  final ratingController = Get.put(RatingController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final colorSchema = Theme.of(context).colorScheme;
    double rating = 5;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              "${controller.title.value}",
              style: textTheme.titleMedium,
            )),
      ),
      body: controller.obx((content) {
        return Obx(() => Column(
              children: <Widget>[
                // Image.network(
                //   "${controller.selectedEpisode.value?.images?.thumbnail}",
                //   height: 200,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
                // Expanded(
                //     child: SingleChildScrollView(
                //   child: Padding(
                //     padding: EdgeInsets.all(8),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Expanded(
                //                 child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: <Widget>[
                //                 Text(
                //                   "${controller.selectedEpisode.value?.title}",
                //                   style: textTheme.headline6
                //                       ?.copyWith(fontSize: 18),
                //                 ),
                //                 Text(
                //                     "Release on: ${controller.selectedEpisode.value?.releaseDate}"),
                //                 Text(
                //                   "Duration: ${controller.selectedEpisode.value?.meta?.duration}",
                //                   style: textTheme.bodyMedium,
                //                 ),
                //               ],
                //             )),
                //             Chip(
                //                 label: Text(controller
                //                             .selectedEpisode.value?.isPremium ==
                //                         true
                //                     ? "Premium"
                //                     : "FREE"))
                //           ],
                //         ),
                //         const SizedBox(
                //           height: 8,
                //         ),
                //         Divider(),
                //         Text(
                //           "Rating",
                //           style: textTheme.labelLarge,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Center(
                //               child: RatingBar.builder(
                //                 initialRating: 3,
                //                 minRating: 1,
                //                 direction: Axis.horizontal,
                //                 allowHalfRating: true,
                //                 itemCount: 5,
                //                 itemPadding: const EdgeInsets.all(4.0),
                //                 itemBuilder: (context, _) => Icon(
                //                   Icons.star,
                //                   size: 20,
                //                   color: HexColor("F6E1A6"),
                //                 ),
                //                 onRatingUpdate: (t) {},
                //               ),
                //             ),
                //             SizedBox(
                //               width: 16,
                //             ),
                //             GestureDetector(
                //               onTap: () {
                //                 ratingBootmSheet(context, (t) {
                //                   rating = t;
                //                 }, () {
                //                   ratingController.ratingVideo(
                //                       rating, content?.id, content?.type);
                //                   Navigator.pop(context);
                //                 });
                //               },
                //               child: Image.asset(
                //                 "assets/add.png",
                //                 color: HexColor("F6E1A6"),
                //                 height: 30,
                //                 width: 30,
                //               ),
                //             )
                //           ],
                //         ),
                //         Text(
                //           "Description",
                //           style: textTheme.labelLarge,
                //         ),
                //         CustomReadmore(
                //             text:
                //                 "${controller.selectedEpisode.value?.description}"),
                //         SizedBox(
                //           height: 16,
                //         ),
                //         SizedBox(
                //           width: double.infinity,
                //           child: ElevatedButton(
                //               onPressed: () {
                //                 playVideo(context,
                //                     "https://videodelivery.net/${controller.selectedEpisode.value?.meta?.id}/manifest/video.m3u8");
                //               },
                //               child: Text("Watch")),
                //         ),
                //         SizedBox(
                //           width: double.infinity,
                //           child: TextButton(
                //               onPressed: () {
                //                 playYoutubeTrailer(
                //                     context, "${content?.trailer}");
                //               },
                //               child: Text("Watch Trailer")),
                //         ),
                //         SizedBox(
                //           height: 16,
                //         ),
                //         CustomDropdown(
                //             items: controller.sessions
                //                 .map((element) => element.title.toString())
                //                 .toList(),
                //             initialValue: controller.sessions[0].title,
                //             onChange: (value) {
                //               controller.filterBySeason(value);
                //             }),
                //         SizedBox(
                //           height: 16,
                //         ),
                //         ListView(
                //           physics: NeverScrollableScrollPhysics(),
                //           shrinkWrap: true,
                //           children: List.generate(
                //               controller
                //                       .selectedSeason.value?.episodes?.length ??
                //                   0, (index) {
                //             final item = controller
                //                 .selectedSeason.value?.episodes?[index];

                //             return GestureDetector(
                //               onTap: () {
                //                 controller.selectedEpisode(item);
                //               },
                //               child: Container(
                //                 color: item?.id ==
                //                         controller.selectedEpisode.value?.id
                //                     ? colorSchema.surfaceVariant
                //                     : null,
                //                 padding: const EdgeInsets.all(8),
                //                 child: Row(
                //                   children: <Widget>[
                //                     ClipRRect(
                //                       borderRadius: BorderRadius.circular(8.0),
                //                       child: Image.network(
                //                         "${item?.images?.thumbnail}",
                //                         height: 80,
                //                         width: 130,
                //                         fit: BoxFit.cover,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       width: 8,
                //                     ),
                //                     Expanded(
                //                         child: Column(
                //                       children: <Widget>[
                //                         Text(
                //                           "${item?.title}",
                //                           maxLines: 3,
                //                           overflow: TextOverflow.ellipsis,
                //                           style: textTheme.titleSmall,
                //                         ),
                //                         SizedBox(
                //                           height: 2,
                //                         ),
                //                         Row(
                //                           children: [
                //                             Padding(
                //                               padding: EdgeInsets.only(top: 3),
                //                               child: Icon(
                //                                 Icons.access_time,
                //                                 size: 14,
                //                               ),
                //                             ),
                //                             SizedBox(
                //                               width: 6,
                //                             ),
                //                             Text(
                //                               "${item?.meta?.duration}",
                //                               style: textTheme.caption,
                //                             )
                //                           ],
                //                         )
                //                       ],
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                     ))
                //                   ],
                //                 ),
                //               ),
                //             );
                //   }),
                // ),
                SectionDivider(
                  title: "Related Contents",
                  onClick: () {
                    Get.to(
                        () => ContentByOrderPage(
                              isPortrait: false,
                              title: "Related Contents",
                            ),
                        arguments: {"orderBy": "latest"});
                  },
                ),
                Container(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        content;
                        final item = [index];
                        return GestureDetector(
                          onTap: () {
                            print("object");

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             SingleContentPage())));
                            // Get.to(() => SingleContentPage(),
                            //     arguments: {"id": item?.id});
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.only(
                              left: 8,
                              // right: index == state.length - 1
                              // ? 8
                              // : 0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    "${content?.images?.thumbnail}",
                                    height: 130,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${content?.title}",
                                  style: textTheme.displayLarge?.copyWith(
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 1),
                ),
              ],
            ));
        //       ),
        //     ))
        //   ],
        // ));
      }),
    );
  }
}

void playYoutubeTrailer(BuildContext context, String url) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.8),
    transitionDuration: Duration(milliseconds: 500),
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
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
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

void playVideo(BuildContext context, String url) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.9),
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Center(
        child: BetterPlayer.network(
          url,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
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
