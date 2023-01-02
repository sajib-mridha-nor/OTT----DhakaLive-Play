 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_meedu_videoplayer/DurationRange.dart';
// import 'package:flutter_meedu_videoplayer/bar.dart';
// import 'package:flutter_meedu_videoplayer/forward_and_rewind.dart';
// import 'package:flutter_meedu_videoplayer/meedu_player.dart';



class BasicPage extends StatefulWidget {
  BasicPage({Key? key}) : super(key: key);

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  // final _meeduPlayerController = MeeduPlayerController(
  //   controlsStyle: ControlsStyle.primary,
  // );

  @override
  void initState() {
    super.initState();
// The following line will enable the Android and iOS wakelock.

    // Wait until the fisrt render the avoid posible errors when use an context while the view is rendering
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _init();
    // });
  }

  // @override
  // void dispose() {
  //   // The next line disables the wakelock again.
  //
  //   _meeduPlayerController.dispose(); // release the video player
  //   super.dispose();
  // }

  /// play a video from network
  // _init() {
  //   _meeduPlayerController.setDataSource(
  //     DataSource(
  //       type: DataSourceType.network,
  //       source:
  //           "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4",
  //     ),
  //     autoplay: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Text("data")
        ),
      ),
    );
  }
}
