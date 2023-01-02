import 'package:flutter/material.dart';
// import 'package:flutter_native_player/flutter_native_player.dart';
// import 'package:flutter_native_player/model/player_resource.dart';
// import 'package:flutter_native_player/model/player_subtitle_resource.dart';
// import 'package:better_player_mat/better_player_mat.dart';

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var url =
//       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

//   String videoUrl =
//       "https://p-events-delivery.akamaized.net/2109isftrwvmiekgrjkbbhxhfbkxjkoj/m3u8/vod_index.m3u8";
//   final playerSubtitleResource = [
//     PlayerSubtitleResource(
//       language: "English",
//       subtitleUrl:
//           "https://raw.githubusercontent.com/Pisey-Nguon/Player-Resource/master/%5BEnglish%5D%20Apple%20Event%20%E2%80%94%20October%2013%20%5BDownSub.com%5D.srt",
//     ),
//     PlayerSubtitleResource(
//       language: "Japanese",
//       subtitleUrl:
//           "https://raw.githubusercontent.com/Pisey-Nguon/Player-Resource/master/%5BJapanese%5D%20Apple%20Event%20%E2%80%94%20October%2013%20%5BDownSub.com%5D.srt",
//     )
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var resourse = PlayerResource(
//         videoUrl: url, playerSubtitleResources: playerSubtitleResource);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Native Player'),
//       ),
//       body: Center(
//         child: FlutterNativePlayer(
//             playerResource: resourse,
//             playWhenReady: true,
//             width: double.infinity,
//             height: 250),
//       ),
//     );
//   }
// }

// class BetterP extends StatelessWidget {
//   BetterP({Key? key}) : super(key: key);

//   BetterPlayerController? _betterPlayerController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Example player"),
//       ),
//       body: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: BetterPlayer.network(
//           "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//           betterPlayerConfiguration: BetterPlayerConfiguration(
//             aspectRatio: 16 / 9,
//           ),
//         ),
//       ),
//     );
//   }
// }
