import 'package:dhakalive/features/content/byCategory/content_by_category_controller.dart';
import 'package:dhakalive/features/content/model/content.dart';
import 'package:dhakalive/features/content/playlist/playlist_content_page.dart';
import 'package:dhakalive/features/content/series/series_content_page.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ContentByCategoryPage extends StatelessWidget {
  final String title;

  ContentByCategoryPage(
      {Key? key, required this.isPortrait, required this.title})
      : super(key: key);

  final controller = Get.put(ContentByCategoryController());
  bool isPortrait = false;
  double height = 120, width = 170;
  // bool isPortrait = false;
  double mainAxisExtent = 145;

  Future<void> onRefresh() async {
    controller.pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: PagedGridView<int, Content>(
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
                  // height: 120,
                  // width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          "${item.images?.thumbnail}",
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
                mainAxisExtent: isPortrait ? mainAxisExtent : 185),
          ),
        ),
      ),
    );
  }
}
