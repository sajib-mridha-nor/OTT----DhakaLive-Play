import 'package:dhakalive/features/channel/model/channel_paginate_response.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChannelsPageController extends GetxController {
  final dioClient = DioClient(BASE_URL, Dio());
  static const _pageSize = 15;

  final PagingController<int, Channel> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final res = await dioClient.get("/channels?type=0&limit=$_pageSize&page=$pageKey");
      final pagination = ChannelPaginateResponse.fromJson(res);
      if (pagination.nextPageUrl == null) {
        pagingController.appendLastPage(pagination.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(pagination.data ?? [], nextPageKey);
      }
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      pagingController.error = message;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}