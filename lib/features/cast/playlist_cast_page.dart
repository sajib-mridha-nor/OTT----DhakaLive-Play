// import 'package:better_player/better_player.dart';
// import 'package:dhakalive/features/cast/playlist_casts_controller.dart';
// import 'package:dhakalive/features/content/byCategory/content_by_category_page.dart';
// import 'package:dhakalive/features/content/playlist/playlist_content_controller.dart';
// import 'package:dhakalive/features/player/youtube_player_page.dart';
// import 'package:dhakalive/utils/hexcolor.dart';
// import 'package:dhakalive/widgets/custom_readmore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';

// import '../../../widgets/custom_bootm_sheet.dart';
// import '../../../widgets/section_divider.dart';
 

// class  CastDetailsPage extends StatefulWidget {
//   CastDetailsPage({Key? key}) : super(key: key);

//   @override
//   State<CastDetailsPage> createState() => _CastDetailsPageState();
// }

// class _CastDetailsPageState extends State<CastDetailsPage> {
//   final controller = Get.put(CastDetailsController());

 

//   int isPlay = 0;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context)
//         .textTheme
//         .apply(displayColor: Theme.of(context).colorScheme.onSurface);
//     final colorSchema = Theme.of(context).colorScheme;
//     double rating = 5;

//     return Scaffold(
//       body: controller.obx((content) {
//         final state = content?[0].videoId;
//         var views = 100;
//         var v = views == 1000
//             ? "1k"
//             : views == 2000
//                 ? "2k"
//                 : views.toString();
//         return Obx(() => CustomScrollView(
//               slivers: <Widget>[
//                 SliverAppBar(
//                     pinned: false,
//                     leading: IconButton(
//                       onPressed: (() {
//                         Get.back();
//                       }),
//                       icon: CircleAvatar(
//                         radius: 15,
//                         child: const Icon(
//                           CupertinoIcons.back,
//                           size: 18,
//                         ),
//                         backgroundColor: Colors.white60.withOpacity(.6),
//                       ),
//                     ),
//                     floating: false,
//                     // backgroundColor: Color(0xFFEDF2F8),
//                     expandedHeight: 240,
//                     flexibleSpace: isPlay == 1
//                         ? PlayVideo(
//                             "https://dlc.ezzecloud.com/videos/68f86b96ea0cac41d6ce31a2277d433b/index.m3u8",
//                             "${state?[0]}")
//                         : isPlay == 2
//                             ? PlayVideoYoutube("ZYzbalQ6Lg8")
//                             : FlexibleSpaceBar(
//                                 background: Image.network(
//                                   "${controller.selectedVideo.value?.images?.thumbnail}",
//                                   height: 240,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               )),
//                 SliverList(
//                     delegate: SliverChildListDelegate([
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 8, bottom: 8, right: 8, left: 8),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 8, bottom: 0, right: 4, left: 4),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Text(
//                                       "${controller.selectedVideo.value?.title}",
//                                       style: textTheme.headline6
//                                           ?.copyWith(fontSize: 15),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: const EdgeInsets.only(left: 4),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: HexColor("FF5722").withOpacity(.9),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           bottom: 5.0,
//                                           top: 5,
//                                           left: 8,
//                                           right: 8),
//                                       child: Text(
//                                         state?.isPremium == true
//                                             ? "Premium"
//                                             : "Free",
//                                         style: textTheme.caption
//                                             ?.copyWith(fontSize: 10),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 4,
//                               ),
//                               Row(
//                                 children: [
//                                   CircleAvatar(
//                                       radius: 2,
//                                       backgroundColor:
//                                           HexColor("FF5722").withOpacity(.7)),
//                                   const SizedBox(
//                                     width: 4,
//                                   ),
//                                   Text(
//                                     "${controller.selectedVideo.value?.channel?.name}",
//                                     style: textTheme.caption?.copyWith(
//                                         fontSize: 11,
//                                         color: Colors.white.withOpacity(.8)),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   CircleAvatar(
//                                       radius: 2,
//                                       backgroundColor:
//                                           HexColor("FF5722").withOpacity(.7)),
//                                   const SizedBox(
//                                     width: 4,
//                                   ),
//                                   Text(
//                                     "${controller.selectedVideo.value?.meta?.duration}",
//                                     style: textTheme.caption?.copyWith(
//                                         fontSize: 11,
//                                         color: Colors.white.withOpacity(.8)),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   CircleAvatar(
//                                       radius: 2,
//                                       backgroundColor:
//                                           HexColor("FF5722").withOpacity(.7)),
//                                   const SizedBox(
//                                     width: 4,
//                                   ),
//                                   Text(
//                                     "${controller.selectedVideo.value?.releaseDate}",
//                                     style: textTheme.caption?.copyWith(
//                                         fontSize: 11,
//                                         color: Colors.white.withOpacity(.8)),
//                                   ),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   CircleAvatar(
//                                     radius: 5,
//                                     // child: Icon(Icons.remove_red_eye),
//                                     backgroundColor:
//                                         Colors.white.withOpacity(.7),
//                                     foregroundColor: Colors.black,
//                                     backgroundImage:
//                                         const AssetImage("assets/eye.png"),
//                                   ),
//                                   const SizedBox(
//                                     width: 4,
//                                   ),
//                                   Text(
//                                     "${v}+",
//                                     style: textTheme.caption?.copyWith(
//                                         fontSize: 11,
//                                         color: Colors.white.withOpacity(.8)),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 1,
//                               ),
//                               Html(
//                                   data:
//                                       "${controller.selectedVideo.value?.description}",
//                                   style: {
//                                     "body": Style(
//                                       color: Colors.white54,
//                                       lineHeight: LineHeight.normal,
//                                       fontSize: FontSize(11),
//                                       margin: Margins.all(0),
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 4),
//                                     )
//                                   }),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 3, // width: double.infinity,
//                               child: SizedBox(
//                                 height: 60,
//                                 child: TextButton(
//                                     style: ButtonStyle(
//                                         shape: MaterialStateProperty.all(
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                         ),
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Colors.white.withOpacity(.6))),
//                                     onPressed: () {
//                                       setState(() {
//                                         isPlay = 2;
//                                       });
//                                       // playYoutubeTrailer(
//                                       //     context, "${content?.trailer}");
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(Icons.play_arrow,
//                                             size: 32, color: Colors.white),
//                                         const SizedBox(
//                                           width: 2,
//                                         ),
//                                         Text(
//                                           "Trailer".toUpperCase(),
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             ),
//                             Expanded(
//                               flex: 4,
//                               // width: double.infinity,
//                               child: SizedBox(
//                                 height: 60,
//                                 child: ElevatedButton(
//                                     style: ButtonStyle(
//                                         shape: MaterialStateProperty.all(
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                         ),
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 HexColor("FF5722"))),
//                                     onLongPress: () {
//                                       setState(() {
//                                         isPlay = 0;
//                                       });
//                                     },
//                                     onPressed: () {
//                                       setState(() {
//                                         isPlay = 1;
//                                       });

//                                       // playVideo(context,
//                                       //     "https://videodelivery.net/${controller.selectedVideo.value?.meta?.id}/manifest/video.m3u8");

//                                       print(
//                                           "https://videodelivery.net/${state?.meta?.id}/manifest/index.m3u8");
//                                       // playVideo(
//                                       //     context,
//                                       //     "https://videodelivery.net/${state?.meta?.id}/manifest/video.m3u8",
//                                       //     "${state?.images?.thumbnail}");
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                             Icons.play_circle_outline_outlined,
//                                             size: 26,
//                                             color: Colors.white),
//                                         const SizedBox(
//                                           width: 8,
//                                         ),
//                                         Text(
//                                           state?.isPremium == false
//                                               ? "Subscribe & Watch"
//                                               : "Watch Now".toUpperCase(),
//                                           style: TextStyle(
//                                               fontSize: state?.isPremium == true
//                                                   ? 14
//                                                   : 18,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: List.generate(
//                                 controller
//                                         .selectedVideo.value?.genres?.length ??
//                                     0, (index) {
//                               final item = controller
//                                   .selectedVideo.value?.genres?[index];
//                               // final item = state?.genres?[index];
//                               return Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(14),
//                                     border: Border.all(
//                                         width: 1, color: Colors.white54)),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 5),
//                                 margin: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "${item?.name}",
//                                   style: textTheme.caption?.copyWith(
//                                       fontSize: 11,
//                                       // fontWeight: FontWeigh,
//                                       color: Colors.white54),
//                                 ),
//                               );
//                             }),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         if (controller.selectedVideo.value?.casts?.length != 1)
//                           Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Casts: ",
//                                     style: textTheme.bodyText2!.copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.normal),
//                                   ),
//                                   const SizedBox(
//                                     width: 2,
//                                   ),
//                                   SizedBox(
//                                     height: 50,
//                                     width: 280,
//                                     child: SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         children: List.generate(
//                                             // controller.selectedVideo.value?.casts
//                                             //         ?.length ??
//                                             3, (index) {
//                                           // final item = controller
//                                           //     .selectedVideo.value?.casts?[index];
//                                           // final item = state?.casts?[index];
//                                           List url = [
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIaBsasz4dq2b7OzzO6jquEXJxYMgULU05Q&usqp=CAU",
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lKjxY7lEHe5IUGFbiFwSOjSC_nq7FtOw_g&usqp=CAU",
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe1UfuDQdBBFZA7SmZqc6wr7onOV6R1SW-ww&usqp=CAU",
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwIaBsasz4dq2b7OzzO6jquEXJxYMgULU05Q&usqp=CAU",
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4lKjxY7lEHe5IUGFbiFwSOjSC_nq7FtOw_g&usqp=CAU",
//                                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe1UfuDQdBBFZA7SmZqc6wr7onOV6R1SW-ww&usqp=CAU"
//                                           ];

//                                           return Padding(
//                                             padding:
//                                                 const EdgeInsets.only(right: 8),
//                                             child: CircleAvatar(
//                                               child: CircleAvatar(
//                                                 backgroundColor: Colors.white,
//                                                 radius: 22,
//                                                 backgroundImage: NetworkImage(
//                                                     // item?.profilePicture??
//                                                     url[index]),
//                                               ),
//                                               backgroundColor: Colors.white,
//                                               radius: 23,
//                                             ),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                             ],
//                           ),
//                         Row(
//                           children: [
//                             Text(
//                               "Categories: ",
//                               style: textTheme.bodyText2!.copyWith(
//                                   fontSize: 14, fontWeight: FontWeight.normal),
//                             ),
//                             const SizedBox(
//                               height: 4,
//                             ),
//                             Container(
//                               height: 30,
//                               width: 250,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: List.generate(
//                                       controller.selectedVideo.value?.categories
//                                               ?.length ??
//                                           0, (index) {
//                                     final item = controller.selectedVideo.value
//                                         ?.categories?[index];
//                                     // final item = state?.categories?[index];
//                                     return GestureDetector(
//                                       onTap: () {
//                                         Get.to(
//                                             () => ContentByCategoryPage(
//                                                 isPortrait: false,
//                                                 title: item!.name!),
//                                             arguments: {"slug": item!.slugEn!});
//                                       },
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(14),
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color: Colors.white54)),
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 10, vertical: 5),
//                                         margin: const EdgeInsets.only(right: 8),
//                                         child: Text(
//                                           "${item?.name}",
//                                           style: textTheme.caption?.copyWith(
//                                               fontSize: 11,
//                                               // fontWeight: FontWeigh,
//                                               color: Colors.white54),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text("Play list:"),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Container(
//                           height: 216,
//                           child: SingleChildScrollView(
//                             child: Column(
//                               // physics: const NeverScrollableScrollPhysics(),
//                               // shrinkWrap: true,
//                               children: List.generate(
//                                   content?.videos?.length ?? 0, (index) {
//                                 final item = content?.videos?[index];
//                                 return Stack(
//                                   // crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           gradient: const LinearGradient(
//                                               end: Alignment.bottomCenter,
//                                               begin: Alignment.topCenter,
//                                               colors: [
//                                                 Color.fromARGB(255, 59, 55, 55),
//                                                 Color.fromARGB(255, 41, 41, 41),
//                                                 Color.fromARGB(255, 31, 30, 30),
//                                               ]),
//                                           borderRadius:
//                                               BorderRadius.circular(0)),
//                                       child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               controller.selectedVideo(item);
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 SizedBox(
//                                                   child: Row(
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     children: [
//                                                       ClipRRect(
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                     .all(
//                                                                 Radius.circular(
//                                                                     8)),
//                                                         child: Image.network(
//                                                           "${item?.images?.cover}",
//                                                           height: 90,
//                                                           width: 160,
//                                                           fit: BoxFit.cover,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         width: 12,
//                                                       ),
//                                                       Expanded(
//                                                         child: Container(
//                                                           // color: Colors.amber,
//                                                           width: 160,
//                                                           height: 88,
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .start,
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               SizedBox(
//                                                                 // width: 98,
//                                                                 // height: 40,
//                                                                 child: Text(
//                                                                   "${item?.title}",
//                                                                   style: textTheme
//                                                                       .displayMedium
//                                                                       ?.copyWith(
//                                                                           fontSize:
//                                                                               12),
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(
//                                                                 height: 4,
//                                                               ),
//                                                               // SizedBox(
//                                                               //   child: Wrap(
//                                                               //     children: List.generate(
//                                                               //       item?.genres?.length ??
//                                                               //           0,
//                                                               //       (index) => Text(
//                                                               //         "${item?.genres?[index].name}"
//                                                               //         "${item?.genres?.length == index + 1 ? "" : ","}",
//                                                               //         overflow: TextOverflow
//                                                               //             .ellipsis,
//                                                               //         style: textTheme
//                                                               //             .caption!
//                                                               //             .copyWith(
//                                                               //           color:
//                                                               //               Colors.white54,
//                                                               //           fontSize: 10,
//                                                               //         ),
//                                                               //       ),
//                                                               //     ),
//                                                               //   ),
//                                                               // ),
//                                                               Row(
//                                                                 children: [
//                                                                   const Padding(
//                                                                     padding: EdgeInsets
//                                                                         .only(
//                                                                             top:
//                                                                                 0),
//                                                                     child: Icon(
//                                                                       Icons
//                                                                           .access_time,
//                                                                       size: 12,
//                                                                       color: Colors
//                                                                           .white54,
//                                                                     ),
//                                                                   ),
//                                                                   const SizedBox(
//                                                                     width: 4,
//                                                                   ),
//                                                                   Text(
//                                                                     "${item?.meta?.duration}",
//                                                                     style: textTheme
//                                                                         .caption!
//                                                                         .copyWith(
//                                                                       color: Colors
//                                                                           .white54,
//                                                                       fontSize:
//                                                                           12,
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               const SizedBox(
//                                                                 width: 2,
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                     ),
//                                     Positioned.fill(
//                                         child: Container(
//                                       height: 90,
//                                       width: 160,
//                                       color: item?.id ==
//                                               controller.selectedVideo.value?.id
//                                           ? Color.fromARGB(255, 186, 116, 37)
//                                               .withOpacity(.2)
//                                           : null,
//                                     ))

//                                     // const SizedBox(
//                                     //   height: 8,
//                                     // )
//                                   ],
//                                 );
//                               }),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: Column(
//                       children: [
//                         SectionDivider(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           style: textTheme.bodyText2!.copyWith(
//                               fontSize: 14, fontWeight: FontWeight.normal),
//                           title:
//                               "Related Contents  [${content?.relatedContent?.length}]",
//                           onClick: () {
//                             Get.to(
//                                 () => ContentByOrderPage(
//                                       isPortrait: true,
//                                       title: "Related Contents",
//                                     ),
//                                 arguments: {"orderBy": "latest"});
//                           },
//                         ),
//                         Container(
//                           height: 120,
//                           child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) {
//                                 final item = content?.relatedContent?[index];
//                                 return Row(
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         Get.to(
//                                             () => ContentByOrderPage(
//                                                   isPortrait: true,
//                                                   title: "Related Contents",
//                                                 ),
//                                             arguments: {"orderBy": "latest"});
//                                         // if (item.type == "SINGLE") {
//                                         //   Get.to(() => SingleContentPage(),
//                                         //       arguments: {"id": item.id});
//                                         // }
//                                         // if (item.type == "PLAYLIST") {
//                                         //   Get.to(() => PlaylistContentPage(),
//                                         //       arguments: {"id": item.id});
//                                         // }
//                                         // if (item.type == "SERIES") {
//                                         //   Get.to(() => SeriesContentPage(),
//                                         //       arguments: {"id": item.id});
//                                         // }
//                                       },
//                                       child: Container(
//                                         width: 160,
//                                         padding: EdgeInsets.only(
//                                             left: 0,
//                                             right: index ==
//                                                     content
//                                                         ?.relatedContent?.length
//                                                 ? 8
//                                                 : 0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             Stack(
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           8.0),
//                                                   child: Image.network(
//                                                     "${item?.images?.thumbnail}",
//                                                     height: 90,
//                                                     width: 160,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               height: 4,
//                                             ),
//                                             Text(
//                                               "${item?.title}",
//                                               style: textTheme.displayLarge
//                                                   ?.copyWith(
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.normal),
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 8,
//                                     ),
//                                   ],
//                                 );
//                               },
//                               itemCount: content?.relatedContent?.length),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ])),
//                 // Expanded(
//                 //     child: SingleChildScrollView(
//                 //   child: Padding(
//                 //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                 //     child: Column(
//                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       children: <Widget>[
//                 //         Row(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: <Widget>[
//                 //             Expanded(
//                 //                 child: Column(
//                 //               crossAxisAlignment: CrossAxisAlignment.start,
//                 //               children: <Widget>[
//                 //                 Text(
//                 //                   "${controller.selectedVideo.value?.title}",
//                 //                   style: textTheme.headline6
//                 //                       ?.copyWith(fontSize: 18),
//                 //                 ),
//                 //                 const SizedBox(
//                 //                   height: 8,
//                 //                 ),
//                 //                 Text(
//                 //                   "Release on: ${controller.selectedVideo.value?.releaseDate}",
//                 //                   style: textTheme.bodyMedium,
//                 //                 ),
//                 //                 Text(
//                 //                   "Duration: ${controller.selectedVideo.value?.meta?.duration}",
//                 //                   style: textTheme.bodyMedium,
//                 //                 ),
//                 //                 Text(
//                 //                   "Channel: ${controller.selectedVideo.value?.channel?.name}",
//                 //                   style: textTheme.bodyMedium,
//                 //                 ),
//                 //               ],
//                 //             )),
//                 //             Chip(
//                 //                 label: Text(
//                 //               controller.selectedVideo.value?.isPremium == true
//                 //                   ? "Premium"
//                 //                   : "FREE",
//                 //               style: textTheme.caption,
//                 //             ))
//                 //           ],
//                 //         ),
//                 //         SizedBox(
//                 //           height: 16,
//                 //         ),
//                 //         SizedBox(
//                 //           width: double.infinity,
//                 //           child: ElevatedButton(
//                 //               onPressed: () {
//                 //                 playVideo(context,
//                 //                     "https://videodelivery.net/${controller.selectedVideo.value?.meta?.id}/manifest/video.m3u8");
//                 //               },
//                 //               child: Text(
//                 //                   controller.selectedVideo.value?.isPremium ==
//                 //                           true
//                 //                       ? "Subscribe & Watch"
//                 //                       : "Watch")),
//                 //         ),
//                 //         SizedBox(
//                 //           width: double.infinity,
//                 //           child: TextButton(
//                 //               onPressed: () {
//                 //                 playYoutubeTrailer(
//                 //                     context, "${content?.trailer}");
//                 //               },
//                 //               child: Text("Watch Trailer")),
//                 //         ),
//                 //         SizedBox(
//                 //           height: 8,
//                 //         ),
//                 //         Container(
//                 //           color: colorSchema.surfaceTint.withOpacity(0.12),
//                 //           padding: EdgeInsets.all(8),
//                 //           child: Column(
//                 //             crossAxisAlignment: CrossAxisAlignment.start,
//                 //             children: <Widget>[
//                 //               Text(
//                 //                 "Playlist",
//                 //                 style: textTheme.labelLarge,
//                 //               ),
//                 //               SizedBox(
//                 //                 height: 16,
//                 //               ),
//                 //       ListView(
//                 //         physics: NeverScrollableScrollPhysics(),
//                 //         shrinkWrap: true,
//                 //         children: List.generate(
//                 //             content?.videos?.length ?? 0, (index) {
//                 //           final item = content?.videos?[index];
//                 //           return GestureDetector(
//                 //             onTap: () {
//                 //               controller.selectedVideo(item);
//                 //             },
//                 //             child: Container(
//                 //               color: item?.id ==
//                 //                       controller.selectedVideo.value?.id
//                 //                   ? colorSchema.surfaceVariant
//                 //                   : null,
//                 //               padding: const EdgeInsets.all(8),
//                 //               child: Row(
//                 //                 children: <Widget>[
//                 //                   ClipRRect(
//                 //                     borderRadius:
//                 //                         BorderRadius.circular(8.0),
//                 //                     child: Image.network(
//                 //                       "${item?.images?.thumbnail}",
//                 //                       height: 80,
//                 //                       width: 130,
//                 //                       fit: BoxFit.cover,
//                 //                     ),
//                 //                   ),
//                 //                   SizedBox(
//                 //                     width: 8,
//                 //                   ),
//                 //                   Expanded(
//                 //                       child: Column(
//                 //                     children: <Widget>[
//                 //                       Text(
//                 //                         "${item?.title}",
//                 //                         maxLines: 3,
//                 //                         overflow: TextOverflow.ellipsis,
//                 //                         style: textTheme.titleSmall,
//                 //                       ),
//                 //                       SizedBox(
//                 //                         height: 2,
//                 //                       ),
//                 //                       Row(
//                 //                         children: [
//                 //                           Padding(
//                 //                             padding:
//                 //                                 EdgeInsets.only(top: 3),
//                 //                             child: Icon(
//                 //                               Icons.access_time,
//                 //                               size: 14,
//                 //                             ),
//                 //                           ),
//                 //                           SizedBox(
//                 //                             width: 6,
//                 //                           ),
//                 //                           Text(
//                 //                             "${item?.meta?.duration}",
//                 //                             style: textTheme.caption,
//                 //                           )
//                 //                         ],
//                 //                       )
//                 //                     ],
//                 //                     crossAxisAlignment:
//                 //                         CrossAxisAlignment.start,
//                 //                   ))
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           );
//                 //         }),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 //         SizedBox(
//                 //           height: 8,
//                 //         ),
//                 //         Divider(),
//                 //         Text(
//                 //           "Rating",
//                 //           style: textTheme.labelLarge,
//                 //         ),
//                 //         Row(
//                 //           mainAxisAlignment: MainAxisAlignment.center,
//                 //           children: [
//                 //             Center(
//                 //               child: RatingBar.builder(
//                 //                 initialRating: 3,
//                 //                 minRating: 1,
//                 //                 direction: Axis.horizontal,
//                 //                 allowHalfRating: true,
//                 //                 itemCount: 5,
//                 //                 itemPadding: const EdgeInsets.all(4.0),
//                 //                 itemBuilder: (context, _) => Icon(
//                 //                   Icons.star,
//                 //                   size: 20,
//                 //                   color: HexColor("F6E1A6"),
//                 //                 ),
//                 //                 onRatingUpdate: (t) {},
//                 //               ),
//                 //             ),
//                 //             SizedBox(
//                 //               width: 16,
//                 //             ),
//                 //             GestureDetector(
//                 //               onTap: () {
//                 //                 ratingBootmSheet(context, (t) {
//                 //                   rating = t;
//                 //                 }, () {
//                 //                   print("tt ${content?.type}");
//                 //                   ratingController.ratingVideo(
//                 //                       rating, content?.id, content?.type);
//                 //                   Navigator.pop(context);
//                 //                 });
//                 //               },
//                 //               child: Image.asset(
//                 //                 "assets/add.png",
//                 //                 color: HexColor("F6E1A6"),
//                 //                 height: 30,
//                 //                 width: 30,
//                 //               ),
//                 //             )
//                 //           ],
//                 //         ),
//                 //         Text(
//                 //           "Description",
//                 //           style: textTheme.labelLarge,
//                 //         ),

//                 //         CustomReadmore(
//                 //             text:
//                 //                 "${controller.selectedVideo.value?.description}"),
//                 //         // Html(
//                 //         //     data: "${controller.selectedVideo.value?.description}",
//                 //         //     style: { "body": Style(margin: Margins.zero, padding: EdgeInsets.zero,)}
//                 //         // ),
//                 //         SizedBox(
//                 //           height: 16,
//                 //         ),
//                 //         Text(
//                 //           "Genres",
//                 //           style: textTheme.labelLarge,
//                 //         ),
//                 //         Wrap(
//                 //           children: List.generate(
//                 //               controller.selectedVideo.value?.genres?.length ??
//                 //                   0, (index) {
//                 //             final item =
//                 //                 controller.selectedVideo.value?.genres?[index];
//                 //             return Padding(
//                 //                 padding: EdgeInsets.only(right: 8),
//                 //                 child: Chip(
//                 //                   label: Text("${item?.name}"),
//                 //                 ));
//                 //           }),
//                 //         ),
//                 //         SizedBox(
//                 //           height: 16,
//                 //         ),
//                 //         Text(
//                 //           "Categories",
//                 //           style: textTheme.labelLarge,
//                 //         ),
//                 //         Wrap(
//                 //           children: List.generate(
//                 //               controller.selectedVideo.value?.categories
//                 //                       ?.length ??
//                 //                   0, (index) {
//                 //             final item = controller
//                 //                 .selectedVideo.value?.categories?[index];
//                 //             return Padding(
//                 //                 padding: EdgeInsets.only(right: 8),
//                 //                 child: ActionChip(
//                 //                   label: Text("${item?.name}"),
//                 //                   onPressed: () {
//                 //                     Get.to(
//                 //                         () => ContentByCategoryPage(
//                 //                             isPortrait: false,
//                 //                             title: item!.name!),
//                 //                         arguments: {"slug": item!.slugEn!});
//                 //                   },
//                 //                 ));
//                 //           }),
//                 //         ),

//                 //         SectionDivider(
//                 //           title: "Related Contents",
//                 //           onClick: () {
//                 //             Get.to(
//                 //                 () => ContentByOrderPage(
//                 //                       isPortrait: true,
//                 //                       title: "Related Contents",
//                 //                     ),
//                 //                 arguments: {"orderBy": "latest"});
//                 //           },
//                 //         ),
//                 //         Container(
//                 //           height: 160,
//                 //           child: ListView.builder(
//                 //               scrollDirection: Axis.horizontal,
//                 //               itemBuilder: (context, index) {
//                 //                 final item = content?.relatedContent?[index];
//                 //                 return GestureDetector(
//                 //                   onTap: () {
//                 //                     print("object");

//                 //                     Navigator.push(
//                 //                         context,
//                 //                         MaterialPageRoute(
//                 //                             builder: ((context) =>
//                 //                                 SingleContentPage())));
//                 //                     Get.to(() => SingleContentPage(),
//                 //                         arguments: {"id": item?.id});
//                 //                   },
//                 //                   child: Container(
//                 //                     width: 200,
//                 //                     padding: const EdgeInsets.only(
//                 //                       left: 8,
//                 //                       // right: index == state.length - 1
//                 //                       // ? 8
//                 //                       // : 0
//                 //                     ),
//                 //                     child: Column(
//                 //                       crossAxisAlignment:
//                 //                           CrossAxisAlignment.start,
//                 //                       children: <Widget>[
//                 //                         ClipRRect(
//                 //                           borderRadius:
//                 //                               BorderRadius.circular(8.0),
//                 //                           child: Image.network(
//                 //                             "${item?.images?.thumbnail}",
//                 //                             height: 130,
//                 //                             width: 200,
//                 //                             fit: BoxFit.cover,
//                 //                           ),
//                 //                         ),
//                 //                         const SizedBox(
//                 //                           height: 4,
//                 //                         ),
//                 //                         Text(
//                 //                           "${item?.title}",
//                 //                           style:
//                 //                               textTheme.displayLarge?.copyWith(
//                 //                             fontSize: 14,
//                 //                           ),
//                 //                           overflow: TextOverflow.ellipsis,
//                 //                         )
//                 //                       ],
//                 //                     ),
//                 //                   ),
//                 //                 );
//                 //               },
//                 //               itemCount: content?.relatedContent?.length),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ))
//               ],
//             ));
//       }),
//     );
//   }
// }

// void playYoutubeTrailer(BuildContext context, String url) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.8),
//     transitionDuration: const Duration(milliseconds: 500),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: YoutubePlayerPage(
//           url: url,
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
//       } else {
//         tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
//       }

//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }

// AspectRatio PlayVideo(url, thumbnail) {
//   return AspectRatio(
//     aspectRatio: 5 / 5,
//     child: BetterPlayer.network(url,
//         betterPlayerConfiguration: BetterPlayerConfiguration(
//             aspectRatio: 5 / 5,
//             placeholder: Image.network(
//               thumbnail,
//               // height: 200,

//               // width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             autoPlay: true,
//             // aspectRatio: 16 / 12,
//             fullScreenByDefault: false,
//             expandToFill: true)),
//   );
// }

// AspectRatio PlayVideoYoutube(
//   url,
// ) {
//   return AspectRatio(
//       aspectRatio: 5 / 5,
//       child: YoutubePlayerPage(
//         url: url,
//       ));
// }

// void playVideo(BuildContext context, String url) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.9),
//     transitionDuration: const Duration(milliseconds: 500),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: BetterPlayer.network(
//           url,
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
//       } else {
//         tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
//       }

//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
