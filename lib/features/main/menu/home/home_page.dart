import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhakalive/features/cast/cast_page.dart';
import 'package:dhakalive/features/channel/channels_page.dart';
import 'package:dhakalive/features/content/byOrder/content_by_order_page.dart';
import 'package:dhakalive/features/content/playlist/playlist_content_page.dart';
import 'package:dhakalive/features/content/series/series_content_page.dart';
import 'package:dhakalive/features/content/single/single_content_page.dart';
import 'package:dhakalive/features/main/menu/home/home_page_controller.dart';
import 'package:dhakalive/features/search/search_page.dart';
import 'package:dhakalive/test/custom_page_screen.dart';
import 'package:dhakalive/utils/hexcolor.dart';
import 'package:dhakalive/widgets/channel_item.dart';
import 'package:dhakalive/widgets/section_divider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomePageController());

  Future<void> onRefresh() async {
    controller.getHomeData();
  }

  double dotIndex = 2.0;

  bool appBarBgClr = false;

  ScrollController _scrollController = ScrollController();
  bool lastStatus = true;
  double height = 20;
  double opacity = 1.0;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        print(opacity);
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        height = height == 20 ? 20 : 165;
        print(height);
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController.hasClients &&
        _scrollController.offset > (250);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   _scrollController.addListener(() {
  //     setState(() {
  //       var scrollOffset = _scrollController.offset;

  //       scrollOffset >= 80 ? appBarBgClr = true : appBarBgClr = false;
  //     });
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // scrollController.appBar.isPinned;
    final textTheme = Theme.of(context).textTheme.apply(
        fontFamily: "Rubik",
        displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xff171717),
      // appBar: ScrollAppBar(
      //   bottomOpacity: .3,
      //   backgroundColor: Colors.white.withOpacity(.2),
      //   title: Text("App Bar"),
      //   controller: scrollController,
      // ),
      body: controller.obx((state) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: CustomScrollView(controller: _scrollController, slivers: [
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,
              expandedHeight: 450,
              centerTitle: false,

              automaticallyImplyLeading: false,

              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(SearchPage());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
              backgroundColor: _isShrink
                  ? Colors.black.withOpacity(.65)
                  : Colors.transparent.withOpacity(.0),

              title: _isShrink
                  ? AnimatedOpacity(
                      duration: const Duration(seconds: 4),
                      opacity: _isShrink == true ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/logo.png",
                          width: 165,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : null,
              // flexibleSpace: FlexibleSpaceBar(
              //     background: Image.network(
              //         "https://media.cntraveler.com/photos/61eae2a9fe18edcbd885cb01/5:4/w_3790,h_3032,c_limit/Seychelles_GettyImages-1169388113.jpg")),

              // leading: appBarBgClr == false
              //     ? Padding(
              //         padding: const EdgeInsets.only(top: 30),
              //         child: Image.asset(
              //           "assets/logo.png",
              //           width: 165,
              //           height: 60,
              //           fit: BoxFit.cover,
              //         ),
              //       )
              //     : Container(),
              // leadingWidth: 300,
              // toolbarHeight: 5,
              flexibleSpace: FlexibleSpaceBar(
                // expandedTitleScale: 1.5,
                collapseMode: CollapseMode.none,
                stretchModes: [StretchMode.fadeTitle],
                background: CarouselSlider(
                    items: List.generate(state?.sliderContents.length ?? 0,
                        (index) {
                      final item = state?.sliderContents[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => SingleContentPage(),
                                  arguments: {"id": item?.id});
                            },
                            child: Image.network(
                              "${item?.images?.thumbnail}",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 600,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 280,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      // Colors.white,
                                      Colors.transparent,

                                      HexColor("171717")
                                    ])),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 16, left: 8, right: 8),
                                  child: Text(
                                    item!.title.toString(),
                                    style: textTheme.titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    options: CarouselOptions(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        // aspectRatio: 16 / 9,
                        height: 500,
                        onPageChanged: (index, reason) {
                          controller.dotIndex.value =
                              double.parse(index.toString());
                        },
                        autoPlay: true,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.ease,
                        enlargeCenterPage: false)),
              ),
            ),

            // SliverAppBar(),
            // controller: scrollController,
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 8,
              ),
              SectionDivider(
                title: "Channels",
                onClick: () {
                  Get.to(() => ChannelsPage());
                },
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state?.channels[index];
                      return ChannelItem(
                        // height: 200,
                        // width: 130,
                        title: item?.name,
                        cover: item?.images?.cover,
                        thumbnail: item?.images?.thumbnail,
                        isVerified: item?.isVerified ?? false,
                        onClick: () {
                          debugPrint("Click");
                        },
                      );
                    },
                    itemCount: 6),
              ),
              SectionDivider(
                title: "Latest",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: true,
                            title: "Latest",
                          ),
                      arguments: {"orderBy": "latest"});
                },
              ),
              Container(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state!.latestContents[index];
                      return GestureDetector(
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
                          width: 160,
                          padding: EdgeInsets.only(
                              left: 8,
                              right: index == state.latestContents.length - 1
                                  ? 8
                                  : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${item.images?.cover}",
                                      height: 90,
                                      width: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Positioned.fill(
                                  //   child: Align(
                                  //     alignment: Alignment.bottomCenter,
                                  //     child: Container(
                                  //       height: 90,
                                  //       width: double.infinity,
                                  //       decoration: BoxDecoration(
                                  //           gradient: LinearGradient(
                                  //               begin: Alignment.topCenter,
                                  //               end: Alignment.bottomCenter,
                                  //               colors: [
                                  //             Colors.transparent,
                                  //             Colors.transparent,
                                  //             Colors.black,
                                  //           ])),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item.title}",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state!.latestContents.length),
              ),
              SectionDivider(
                title: "Trending",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: false,
                            title: "Trending",
                          ),
                      arguments: {"orderBy": "trending"});
                },
              ),
              Container(
                height: 205,
                child: ListView.builder(
                    shrinkWrap: true,
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 1,
                    //         crossAxisSpacing: 4,
                    //         mainAxisSpacing: 0,
                    //         mainAxisExtent: 130),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.latestContents[index];
                      return GestureDetector(
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
                          padding: const EdgeInsets.only(left: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${item.images?.thumbnail}",
                                      height: 180,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black54,
                                                ])),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: 130,
                                child: Text(
                                  "${item.title}",
                                  style: textTheme.displayLarge?.copyWith(
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.latestContents.length),
              ),
              SectionDivider(
                title: "Most views",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: false,
                            title: "Most Views",
                          ),
                      arguments: {"orderBy": "views"});
                },
              ),
              Container(
                height: 205,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.mostViewContents[index];
                      return GestureDetector(
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
                          width: 130,
                          padding: const EdgeInsets.only(left: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${item.images?.thumbnail}",
                                      height: 180,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black54,
                                                ])),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item.title}",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.mostViewContents.length),
              ),
              SectionDivider(
                title: "Casts",
                onClick: () {
                  Get.to(() => CastPage(
                        isPortrait: false,
                      ));
                },
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.casts[index];
                      return ChannelItem(
                        // height: 200,
                        // width: 130,
                        title: item.name,
                        cover: item.profilePicture,
                        thumbnail: item.profilePicture,

                        onClick: () {
                          debugPrint("Click");
                        },
                      );
                    },
                    itemCount: state.casts.length),
              ),
              SectionDivider(
                title: "Natok",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: true,
                            title: "Latest",
                          ),
                      arguments: {"orderBy": "latest"});
                },
              ),
              Container(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.natokContents[index];
                      return GestureDetector(
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
                          width: 160,
                          padding: const EdgeInsets.only(left: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  "${item.images?.cover}",
                                  height: 90,
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item.title}",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.natokContents.length),
              ),
              SectionDivider(
                title: "Motivation",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: false,
                            title: "Most Views",
                          ),
                      arguments: {"orderBy": "views"});
                },
              ),
              Container(
                height: 205,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.motivationContents[index];
                      return GestureDetector(
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
                          width: 130,
                          padding: const EdgeInsets.only(left: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${item.images?.thumbnail}",
                                      height: 180,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black54,
                                                ])),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item.title}",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.motivationContents.length),
              ),
              SectionDivider(
                title: "Document",
                onClick: () {
                  Get.to(
                      () => ContentByOrderPage(
                            isPortrait: false,
                            title: "Most Views",
                          ),
                      arguments: {"orderBy": "views"});
                },
              ),
              Container(
                height: 205,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = state.documentContents[index];
                      return GestureDetector(
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
                          width: 130,
                          padding: const EdgeInsets.only(left: 8, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "${item.images?.thumbnail}",
                                      height: 180,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 180,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black54,
                                                ])),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${item.title}",
                                style: textTheme.displayLarge?.copyWith(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: state.documentContents.length),
              ),
            ]))
          ]),
          // SizedBox(
          //   height: 80,
          //   child: AnimatedContainer(
          //     duration: Duration(seconds: 4),
          //     color: appBarBgClr == false ? _colore[0] : _colore[1],
          //     // Provide an optional curve to make the animation feel smoother.
          //     curve: Curves.fastOutSlowIn,
          //     child: AppBar(
          //       // elevation: 10,

          //       // flexibleSpace: Container(
          //       //   // color: Colors.amber,
          //       //   height: _height,
          //       //   child: Row(
          //       //     mainAxisAlignment: MainAxisAlignment.start,
          //       //     crossAxisAlignment: CrossAxisAlignment.end,
          //       //     children: [
          //       //       // Icon(Icons.abc),
          //       //     ],
          //       //   ),
          //     ),
          //   ),
          // ),
        );
      }, onLoading: const HomeLoadingWidget()),
    );
  }
}

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              enabled: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 450,
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 120,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 150,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 164,
                              height: 94,
                              decoration: const BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 150,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 184,
                              width: 134,
                              decoration: const BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
