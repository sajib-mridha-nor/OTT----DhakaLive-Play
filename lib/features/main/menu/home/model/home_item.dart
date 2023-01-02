import 'package:dhakalive/features/channel/model/channel_paginate_response.dart';
import 'package:dhakalive/features/content/model/Cast.dart';
import 'package:dhakalive/features/content/model/content.dart';
import 'package:dhakalive/features/slider/model/slider_response.dart';

class HomeItem {
  final List<Content> latestContents;
  final List<Content> trendingContents;
  final List<Content> mostViewContents;
  final List<Content> natokContents;
  final List<Content> motivationContents;
  final List<Content> documentContents;
  final List<Slider> sliderContents;
  final List<Channel> channels;
  final List<Data> casts;

  HomeItem(
      {required this.latestContents,
      required this.sliderContents,
      required this.trendingContents,
      required this.natokContents,
      required this.documentContents,
      required this.motivationContents,
      required this.mostViewContents,
      required this.channels,
      required this.casts});
}
