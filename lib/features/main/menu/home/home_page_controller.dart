import 'package:dhakalive/features/channel/model/channel_paginate_response.dart';
import 'package:dhakalive/features/content/model/Cast.dart';
import 'package:dhakalive/features/main/menu/home/model/home_item.dart';
import 'package:dhakalive/features/content/model/content_pagination_response.dart';
import 'package:dhakalive/features/slider/model/slider_response.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin<HomeItem> {
  final dioClient = DioClient(BASE_URL, Dio());
  RxDouble dotIndex = 2.0.obs;

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  void getHomeData() async {
    try {
      change(null, status: RxStatus.loading());
      final latestVideosRes = await dioClient.get("contents");
      final mostViewsVideosRes =
          await dioClient.get("contents?limit=15&page=1&orderBy=views");
      final natokRes =
          await dioClient.get("contents?limit=15&page=1&category=natok");
      final documentRes =
          await dioClient.get("contents?limit=15&page=1&category=document");
      final motivationRes =
          await dioClient.get("contents?limit=15&page=1&category=motivational");
      final trendingVideosRes =
          await dioClient.get("contents?limit=15&page=1&orderBy=trending");
      final sliderVideosRes = await dioClient.get("sliders");
      final channelsRes = await dioClient.get("channels?limit=15&page=1");
      final castRes = await dioClient.get("casts");
      final latestContents =
          ContentPaginationResponse.fromJson(latestVideosRes).data ?? [];
      final natokContents =
          ContentPaginationResponse.fromJson(natokRes).data ?? [];
      final motivationContents =
          ContentPaginationResponse.fromJson(motivationRes).data ?? [];
      final documentContents =
          ContentPaginationResponse.fromJson(documentRes).data ?? [];
      final mostViewContents =
          ContentPaginationResponse.fromJson(mostViewsVideosRes).data ?? [];
      final trendingContents =
          ContentPaginationResponse.fromJson(trendingVideosRes).data ?? [];
      final sliderContents =
          SliderResponse.fromJson(sliderVideosRes).data ?? [];
      final casts = Cast.fromJson(castRes).data ?? [];
      final channels = ChannelPaginateResponse.fromJson(channelsRes).data ?? [];

      change(
          HomeItem(
              latestContents: latestContents,
              sliderContents: sliderContents,
              mostViewContents: mostViewContents,
              trendingContents: trendingContents,
              natokContents: natokContents,
              motivationContents: motivationContents,
              documentContents: documentContents,
              channels: channels,
              casts: casts),
          status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}
