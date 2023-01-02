import 'package:dhakalive/features/main/menu/profile/profile_page_v1.dart';
import 'package:get/get.dart';
import 'menu/download/download_page.dart';
import 'menu/explor/explore_page.dart';
import 'menu/home/home_page.dart';
import 'menu/liveTv/live_tv_page.dart';
import 'menu/profile/profile_page.dart';

class MainPageController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pages = [
    HomePage(),
    LiveTvPage(),
    ExplorePage(),
    ProfilePage(),
  ];
}
