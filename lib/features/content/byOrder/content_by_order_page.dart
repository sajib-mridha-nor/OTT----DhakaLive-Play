import 'package:dhakalive/features/content/byOrder/content_by_order_controller.dart';
import 'package:dhakalive/features/content/model/content.dart';
import 'package:dhakalive/features/content/playlist/playlist_content_page.dart';
import 'package:dhakalive/features/content/series/series_content_page.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ContentByOrderPage extends StatelessWidget {
  final String title;
  bool isPortrait = false;

  ContentByOrderPage({Key? key, required this.isPortrait, required this.title})
      : super(key: key);

  Future<void> onRefresh() async {
    controller.pagingController.refresh();
  }

  final controller = Get.put(ContentByOrderController());
  double height = 95, width = 170;
  // bool isPortrait = false;
  double mainAxisExtent = 115;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      backgroundColor: Color(0xff141415),
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
          onRefresh: onRefresh,
          child: Offstage(
            offstage: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: PagedGridView<int, Content>(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Content>(
                  itemBuilder: (context, item, index) => GestureDetector(
                    onTap: () {
                      if (item.type == "SINGLE") {
                        Get.to(() => SingleContentPage(),
                            arguments: {"id": item.id});
                      }
                      if (item.type == "PLAYLIST") {
                        Get.to(() => PlaylistContentPage(),
                            arguments: {"id": item.id});
                      }
                      if (item.type == "SERIES") {
                        Get.to(() => SeriesContentPage(),
                            arguments: {"id": item.id});
                      }
                    },
                    child: Container(
                      // color: Colors.amber,
                      // height: 520,
                      // width: 160,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              isPortrait
                                  ? "${item.images?.cover}"
                                  : "${item.images?.thumbnail}",
                              height: isPortrait ? height : 150,
                              width: isPortrait ? width : 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${item.title}",
                            style: textTheme.displayLarge?.copyWith(
                                fontSize: 11, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    // childAspectRatio: 1.1,
                    mainAxisExtent: isPortrait ? mainAxisExtent : 175),
              ),
            ),
          )),
    );
  }
}
