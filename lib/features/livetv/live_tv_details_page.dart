import 'package:dhakalive/widgets/chennal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveTVDetailsPage extends StatefulWidget {
  const LiveTVDetailsPage({Key? key}) : super(key: key);

  @override
  State<LiveTVDetailsPage> createState() => _LiveTVDetailsPageState();
}

class _LiveTVDetailsPageState extends State<LiveTVDetailsPage> {
  List chennalList = [
    "assets/tv4.png",
    "assets/tv4.png",
    "assets/tv5.png",
    "assets/tv4.png",
    "assets/tv4.png",
    "assets/tv5.png",
    "assets/tv4.png",
    "assets/tv4.png",
    "assets/tv5.png",
  ];
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
      //   'https://www.youtube.com/watch?v=vIaH35-MLsk&ab_channel=AkonVEVO')
      // ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

      //   setState(() {});
      // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live TV"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {
          // _controller.value.isPlaying
          //     ? _controller.pause()
          //     : _controller.play();
        });
      })),
      body: Column(
        children: [
          Center(
            // child: _controller.value.isInitialized
            //     ? AspectRatio(
            //         aspectRatio: _controller.value.aspectRatio,
            //         child: VideoPlayer(_controller),
                  ),
          //       : Container(
          //           height: 200,
          //           width: double.infinity,
          //           child: const ColoredBox(
          //             child: Text("Lets go"),
          //             color: Colors.cyan,
          //           ),
          //         ),
          // ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      "News Channel",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    
                      child: GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: [
                        const QuiltedGridTile(1, 4),
                        const QuiltedGridTile(1, 2),
                        const QuiltedGridTile(1, 2),
                       
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => ChennalCard(
                              img: chennalList[index],
                            ),
                        childCount: 6),
                    semanticChildCount: 5,
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                   
                    child:  Text(
                      "Sports",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                  
                      child: GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: [
                        const QuiltedGridTile(1, 4),
                        const QuiltedGridTile(1, 2),
                        const QuiltedGridTile(1, 2),
                    
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => ChennalCard(
                              img: chennalList[index],
                            ),
                        childCount: 6),
                    semanticChildCount: 5,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
