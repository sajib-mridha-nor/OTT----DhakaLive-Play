import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key, this.url, this.thumbnail}) : super(key: key);
  final url;
  final thumbnail;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var url =
      "https://videodelivery.net/b86865668443c6b0abad306fdf96d5bb/manifest/video.m3u8";

  var url2 =
      "https://videodelivery.net/b86865668443c6b0abad306fdf96d5bb/manifest/video.m3u8";

  // https://customer-26fla1e5qls9j40q.cloudflarestream.com/c26ef872e9aaafdca4b6789d0ed11654/manifest/video.m3u8

  var cldUrl =
      // "https://cloudflarestream.com/266179333ff7c048ba7e63b1a6c9a608/downloads/default.mp4";
      // "https://iframe.videodelivery.net/b86865668443c6b0abad306fdf96d5bb";
      // "https://customer-26fla1e5qls9j40q.cloudflarestream.com/c26ef872e9aaafdca4b6789d0ed11654/manifest/video.m3u8";
      "https://dlc.ezzecloud.com/videos/68f86b96ea0cac41d6ce31a2277d433b/index.m3u8";

  // "https://videodelivery.net/68f86b96ea0cac41d6ce31a2277d433b/manifest/video.m3u8";

  //       BetterPlayerDataSource dataSource = BetterPlayerDataSource(
  //     BetterPlayerDataSourceType.network, Constants.dashStreamUrl,
  //     useAsmsSubtitles: true, useAsmsTracks: true);
  // _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
  // _betterPlayerController.setupDataSource(dataSource);

  late BetterPlayerController _betterPlayerController;

  player(cldUrl, thumbnail) {
    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, cldUrl);
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          fullScreenByDefault: true,
          showPlaceholderUntilPlay: true,
          autoPlay: false,
          placeholder: Image.network(
            thumbnail,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  void initState() {
    super.initState();

    player(widget.url, widget.thumbnail);
  }

  @override
  void dispose() {
    _betterPlayerController;
    player(cldUrl, widget.thumbnail);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 12,
          child: BetterPlayer(
            controller: _betterPlayerController,
          ),
        ),
      ),
      // body: AspectRatio(
      //   aspectRatio: 16.0 / 9.0,
      //   child: BetterVideoPlayer(
      //     controller: BetterVideoPlayerController(),
      //     dataSource: BetterVideoPlayerDataSource(
      //       BetterVideoPlayerDataSourceType.network,
      //       cldUrl,
      //     ),
      //     configuration: BetterVideoPlayerConfiguration(),
      //   ),
      // ),
    );
  }
}
