// import 'package:dhakalive/test/flutter_native.dart';
// import 'package:flutter/material.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'dart:async';

// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:video_player/video_player.dart';

// class SamplePlayer extends StatefulWidget {
//   SamplePlayer({Key? key}) : super(key: key);

//   @override
//   _SamplePlayerState createState() => _SamplePlayerState();
// }

// class _SamplePlayerState extends State<SamplePlayer> {
//   late FlickManager flickManager;

//   var url =
//       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

//   player(url, isPlay) async {
//     flickManager = FlickManager(
//       autoInitialize: isPlay,
//       videoPlayerController: VideoPlayerController.network(url),
//     );
//   }

//   bool isPlay = false;
//   @override
//   void initState() {
//     super.initState();
//     player(url, true);
//   }

//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }

//   var flickPortraitControls = FlickVideoWithControls();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           child: FlickVideoPlayer(
//               // flickVideoWithControls: FlickVideoWithControls(
//               //     aspectRatioWhenLoading: 1.5,
//               //     controls: const FlickPortraitControls()),
//               flickManager: FlickManager(
//             autoInitialize: isPlay,
//             videoPlayerController: VideoPlayerController.network(url),
//           )),
//         ),
//         FloatingActionButton(onPressed: () {
//           setState(() {
//             Get.to(MyApp());
//             // player(url, true);
//           });
//         })
//       ],
//     );
//   }
// }

// // class CustomOrientationControls extends StatelessWidget {
// //   const CustomOrientationControls(
// //       {Key? key, this.iconSize = 20, this.fontSize = 12, this.dataManager})
// //       : super(key: key);
// //   final double iconSize;
// //   final double fontSize;
// //   final DataManager? dataManager;

// //   @override
// //   Widget build(BuildContext context) {
// //     FlickVideoManager flickVideoManager =
// //         Provider.of<FlickVideoManager>(context);

// //     return Stack(
// //       children: <Widget>[
// //         Positioned.fill(
// //           child: FlickAutoHideChild(
// //             child: Container(color: Colors.black38),
// //           ),
// //         ),
// //         Positioned.fill(
// //           child: FlickShowControlsAction(
// //             child: FlickSeekVideoAction(
// //               child: Center(
// //                 child: flickVideoManager.nextVideoAutoPlayTimer != null
// //                     ? FlickAutoPlayCircularProgress(
// //                         colors: FlickAutoPlayTimerProgressColors(
// //                           backgroundColor: Colors.white30,
// //                           color: Colors.red,
// //                         ),
// //                       )
// //                     : FlickAutoHideChild(
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: <Widget>[
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: GestureDetector(
// //                                 onTap: () {
// //                                   dataManager!.skipToPreviousVideo();
// //                                 },
// //                                 child: Icon(
// //                                   Icons.skip_previous,
// //                                   color: dataManager!.hasPreviousVideo()
// //                                       ? Colors.white
// //                                       : Colors.white38,
// //                                   size: 35,
// //                                 ),
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: FlickPlayToggle(size: 50),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: GestureDetector(
// //                                 onTap: () {
// //                                   dataManager!.skipToNextVideo();
// //                                 },
// //                                 child: Icon(
// //                                   Icons.skip_next,
// //                                   color: dataManager!.hasNextVideo()
// //                                       ? Colors.white
// //                                       : Colors.white38,
// //                                   size: 35,
// //                                 ),
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         Positioned.fill(
// //           child: FlickAutoHideChild(
// //             child: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: <Widget>[
// //                   Row(
// //                     children: <Widget>[
// //                       Row(
// //                         children: <Widget>[
// //                           FlickCurrentPosition(
// //                             fontSize: fontSize,
// //                           ),
// //                           Text(
// //                             ' / ',
// //                             style: TextStyle(
// //                                 color: Colors.white, fontSize: fontSize),
// //                           ),
// //                           FlickTotalDuration(
// //                             fontSize: fontSize,
// //                           ),
// //                         ],
// //                       ),
// //                       Expanded(
// //                         child: Container(),
// //                       ),
// //                       FlickFullScreenToggle(
// //                         size: iconSize,
// //                       ),
// //                     ],
// //                   ),
// //                   FlickVideoProgressBar(
// //                     flickProgressBarSettings: FlickProgressBarSettings(
// //                       height: 5,
// //                       handleRadius: 5,
// //                       curveRadius: 50,
// //                       backgroundColor: Colors.white24,
// //                       bufferedColor: Colors.white38,
// //                       playedColor: Colors.red,
// //                       handleColor: Colors.red,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class DataManager {
// //   DataManager({required this.flickManager, required this.urls});

// //   int currentPlaying = 0;
// //   final FlickManager flickManager;
// //   final List<String> urls;

// //   late Timer videoChangeTimer;

// //   String getNextVideo() {
// //     currentPlaying++;
// //     return urls[currentPlaying];
// //   }

// //   bool hasNextVideo() {
// //     return currentPlaying != urls.length - 1;
// //   }

// //   bool hasPreviousVideo() {
// //     return currentPlaying != 0;
// //   }

// //   skipToNextVideo([Duration? duration]) {
// //     if (hasNextVideo()) {
// //       flickManager.handleChangeVideo(
// //           VideoPlayerController.network(urls[currentPlaying + 1]),
// //           videoChangeDuration: duration);

// //       currentPlaying++;
// //     }
// //   }

// //   skipToPreviousVideo() {
// //     if (hasPreviousVideo()) {
// //       currentPlaying--;
// //       flickManager.handleChangeVideo(
// //           VideoPlayerController.network(urls[currentPlaying]));
// //     }
// //   }

// //   cancelVideoAutoPlayTimer({required bool playNext}) {
// //     if (playNext != true) {
// //       currentPlaying--;
// //     }

// //     flickManager.flickVideoManager
// //         ?.cancelVideoAutoPlayTimer(playNext: playNext);
// //   }
// // }
