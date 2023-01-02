import 'package:dhakalive/features/cast/cast_controller.dart';
import 'package:dhakalive/features/content/byCategory/content_by_category_controller.dart';
import 'package:dhakalive/features/content/model/content.dart';
import 'package:dhakalive/features/content/playlist/playlist_content_page.dart';
import 'package:dhakalive/features/content/series/series_content_page.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CastPage extends StatelessWidget {
  CastPage({
    Key? key,
    required this.isPortrait,
  }) : super(key: key);

  final controller = Get.put(CastPageController());
  bool isPortrait = false;
  double height = 95, width = 170;
  // bool isPortrait = false;
  double mainAxisExtent = 115;

  Future<void> onRefresh() async {
    // controller.pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return controller.obx((content) => Scaffold(
          appBar: AppBar(
            title: Text("Casts"),
          ),
          body: RefreshIndicator(
            onRefresh: onRefresh,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: content?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    // childAspectRatio: 1.1,
                    mainAxisExtent: 175),
                itemBuilder: (BuildContext context, int index) {
                  final item = content?[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                        onTap: () {
                          // if (item. == "SINGLE") {
                          //   Get.to(() => SingleContentPage(),
                          //       arguments: {"id": item.id});
                          // }

                          Get.to(() => PlaylistContentPage(),
                              arguments: {"id": item?.id});

                          // if (item.type == "SERIES") {
                          //   Get.to(() => SeriesContentPage(),
                          //       arguments: {"id": item.id});
                          // }
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
                                  "${item?.profilePicture}",
                                  height: 150,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item?.name}",
                                style: textTheme.displayLarge?.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
