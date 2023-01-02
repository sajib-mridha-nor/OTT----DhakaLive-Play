import 'package:dhakalive/features/main/main_page_controller.dart';
import 'package:dhakalive/features/search/search_page.dart';
import 'package:dhakalive/test/flutter_native.dart';
import 'package:dhakalive/test/memu.dart';
import 'package:dhakalive/test/player.dart';
import 'package:dhakalive/test/t.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/hexcolor.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Color(0xff141415),

        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   titleSpacing: 0,
        //   title: Image.asset(
        //     "assets/logo.png",
        //     width: 165,
        //   ),
        //   actions: <Widget>[
        //     SizedBox(
        //       height: 36,
        //       width: 36,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Get.to(() => const SearchPage());
        //         },
        //         child: Image.asset(
        //           "assets/search.png",
        //           color: Colors.white,
        //           width: 18,
        //           height: 18,
        //         ),
        //         style: ElevatedButton.styleFrom(
        //             shape: const CircleBorder(),
        //             padding: const EdgeInsets.all(0),
        //             primary: Colors.white12),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 8,
        //     ),
        //     SizedBox(
        //       height: 36,
        //       width: 36,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Get.to(() => T());
        //         },
        //         child: Icon(
        //           Icons.notifications,
        //           color: Colors.white,
        //         ),
        //         style: ElevatedButton.styleFrom(
        //             shape: const CircleBorder(),
        //             padding: const EdgeInsets.all(0),
        //             primary: Colors.white12),
        //       ),
        //     ),
        //   ],
        // ),

        body: controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(0),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: controller.selectedIndex.value == 0
                      ? HexColor("FF5722")
                      : Color.fromARGB(255, 216, 216, 216),
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Home',
              // backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(0),
                child: SvgPicture.asset(
                  "assets/icons/live_tv.svg",
                  color: controller.selectedIndex.value == 1
                      ? HexColor("FF5722")
                      : Color.fromARGB(255, 216, 216, 216),
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Live Tv',
              // backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(0),
                child: SvgPicture.asset(
                  "assets/icons/explore.svg",
                  color: controller.selectedIndex.value == 2
                      ? HexColor("FF5722")
                      : Color.fromARGB(255, 216, 216, 216),
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Explore',
              // backgroundColor: Colors.black87,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(0),
                child: SvgPicture.asset(
                  "assets/icons/person.svg",
                  color: controller.selectedIndex.value == 3
                      ? HexColor("FF5722")
                      : Color.fromARGB(255, 216, 216, 216),
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Profile',
              // backgroundColor: Colors.black87,
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: HexColor("FF5722"),
          iconSize: 20,
          selectedFontSize: 10,
          unselectedFontSize: 9,
          onTap: (index) {
            controller.selectedIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: HexColor("071C21"),
          selectedLabelStyle: TextStyle(color: HexColor("F6E1A6")),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
        )));
  }
}
