import 'package:dhakalive/features/channel/channels_page_controller.dart';
import 'package:dhakalive/features/channel/model/channel_paginate_response.dart';
import 'package:dhakalive/widgets/channel_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChannelsPage extends StatelessWidget {
  ChannelsPage({Key? key}) : super(key: key);

  final controller = Get.put(ChannelsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Channels"),
        ),
        body: PagedGridView<int, Channel>(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<Channel>(
              itemBuilder: (context, item, index) => Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: ChannelCard(
                      // height: 200,
                      width: double.infinity,
                      title: item.name,
                      cover: item.images?.cover,
                      thumbnail: item.images?.thumbnail,
                      isVerified: item.isVerified ?? false,
                      onClick: () {
                        debugPrint("Click");
                      },
                    ),
                  )),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8,
              mainAxisExtent: 156),
        ));
  }
}
