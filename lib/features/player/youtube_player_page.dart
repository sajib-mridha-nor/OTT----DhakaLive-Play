import 'package:dhakalive/utils/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatelessWidget {
  final String url;
  const YoutubePlayerPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? videoID = YoutubePlayer.convertUrlToId(url);

    return YoutubePlayer(
      aspectRatio: 5 / 5,
      progressColors: ProgressBarColors(),
      controller: YoutubePlayerController(
        initialVideoId: videoID.toString(),
        flags: YoutubePlayerFlags(
          hideControls: false,
          controlsVisibleAtStart: false,
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: false,
      progressIndicatorColor: Colors.yellow,
    );
  }
}
