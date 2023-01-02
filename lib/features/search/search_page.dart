import 'package:dhakalive/features/content/model/content.dart';
import 'package:dhakalive/features/content/playlist/playlist_content_page.dart';
import 'package:dhakalive/features/content/series/series_content_page.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:dhakalive/features/search/search_page_controller.dart';
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/row_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SearchBar searchBar;
  final controller = Get.put(SearchPageController());

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xff171717),
        title: const Text("Search"),
        actions: [
          searchBar.getSearchAction(context),
        ]);
  }

  void onSubmitted(String value) {
    controller.query(value);
    controller.pagingController.refresh();
  }

  @override
  void initState() {
    searchBar = SearchBar(
        inBar: true,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        clearOnSubmit: false,
        closeOnSubmit: false,
        onCleared: () {
          debugPrint("Search bar has been cleared");
        },
        onClosed: () {
          debugPrint("Search bar has been closed");
        });
    Future.delayed(const Duration(milliseconds: 500), () {
      searchBar.beginSearch(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      key: _scaffoldKey,
      appBar: searchBar.build(context),
      body: Padding(
        padding: const EdgeInsets.only(right: 0, left: 0, top: 0),
        child: PagedListView<int, Content>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Content>(
            itemBuilder: (context, item, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(255, 59, 55, 55),
                            Color.fromARGB(255, 41, 41, 41),
                            Color.fromARGB(255, 31, 30, 30),
                          ]),
                      color: Color.fromARGB(255, 35, 35, 35),
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
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
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  child: Image.network(
                                    "${item.images?.cover}",
                                    height: 90,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Container(
                                    // color: Colors.amber,
                                    width: 160,
                                    height: 88,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          // width: 98,
                                          // height: 40,
                                          child: Text(
                                            "${item.title}",
                                            style: textTheme.displayMedium
                                                ?.copyWith(fontSize: 12),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          child: Wrap(
                                            children: List.generate(
                                              item.genres?.length ?? 0,
                                              (index) => Text(
                                                "${item.genres?[index].name}"
                                                "${item.genres?.length == index + 1 ? "" : ","}",
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    textTheme.caption!.copyWith(
                                                  color: Colors.white54,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${item.views} Views",
                                          style: textTheme.caption!.copyWith(
                                            color: Colors.white54,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       ClipRRect(
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         child: Image.network(
                          //           "${item.images?.thumbnail}",
                          //           height: 110,
                          //           width: 140,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         width: 4,
                          //       ),
                          //       SizedBox(
                          //         width: 200,
                          //         child: Text(
                          //           "${item.title}",
                          //           style: textTheme.labelLarge,
                          //           overflow: TextOverflow.ellipsis,
                          //         ),
                          //       )
                          // ],
                          // ),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 8,
                // )
              ],
            ),
          ),
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 8.0,
          //     mainAxisSpacing: 0,
          //     mainAxisExtent: 150),
        ),
      ),
    );
  }
}
