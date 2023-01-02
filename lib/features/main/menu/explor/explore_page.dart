import 'package:dhakalive/features/category_details_page.dart';
import 'package:dhakalive/features/content/byCategory/content_by_category_page.dart';
import 'package:dhakalive/features/main/menu/explor/explore_page_controller.dart';
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/custom_cashe_image.dart';
import 'package:dhakalive/widgets/explore_card.dart';
import 'package:dhakalive/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  final controller = Get.put(ExplorePageController());

  List clr = [
    "#120A42",
    "#522200",
    "#120A42",
    "#8C2113",
    "#3F3203",
    "#7B3B00",
    "#09090C",
    "#3E0847",
    "#086167",
    "#014F41",
    "#642E10",
    "#42140D"
  ];
  List exploreTitle = [
    "Web Series",
    "Trending",
    "Most Propular",
    "Shorts",
    "Downloads",
    "Event",
    "Self Learning",
    "Documentaries",
    "Drama Series",
    "Motivitional",
    "Live Stream",
    "Live TV",
  ];

  Future<void> onRefresh() async {
    // controller.getExploreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx((state) {
      return RefreshIndicator(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      // height: 200,
                      child: GridView.custom(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.same,
                      pattern: 10 % 3 == 0
                          ? [
                              QuiltedGridTile(1, 4),
                              QuiltedGridTile(1, 2),
                              QuiltedGridTile(1, 2),
                            ]
                          : [
                              QuiltedGridTile(2, 4),
                              QuiltedGridTile(2, 2),
                              QuiltedGridTile(2, 2),
                              QuiltedGridTile(2, 4),
                            ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => SizedBox(
                              height: 500,
                              child: ExploreCard(
                                onClick: () {
                                  Get.to(
                                      () => ContentByCategoryPage(
                                          isPortrait: false,
                                          title: state![index].name!),
                                      arguments: {
                                        "slug": state![index].slugEn!
                                      });
                                },
                                clr: clr[index],
                                img: state![index].images!.cover,
                                title: state[index].name,
                              ),
                            ),
                        childCount: state!.length),
                    semanticChildCount: 5,
                  )),
                ],
              ),
            ),
          ),
          onRefresh: onRefresh);
    },
            onLoading: ShimmerEffect(),
            onError: (message) => Center(child: Text("Show Error$message"))));
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.custom(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: 10 % 3 == 0
            ? [
                QuiltedGridTile(1, 4),
                QuiltedGridTile(1, 2),
                QuiltedGridTile(1, 2),
              ]
            : [
                QuiltedGridTile(1, 4),
                QuiltedGridTile(1, 2),
                QuiltedGridTile(1, 2),
              ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => ShimmerImage(),
      ),
      semanticChildCount: 5,
    ));
  }
}
