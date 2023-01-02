import 'package:dhakalive/features/content/model/content_details_responsee.dart';
import 'package:dhakalive/utils/constant.dart';

import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/network/dio_client.dart';

class RatingController extends GetxController {
  final dioClient = DioClient.instance;

  void ratingVideo(rating, id, contentType) async {
    try {
      final res = await dioClient.post("reviews", data: {
        "content-type": contentType,
        "content_id": id,
        "rating": rating
      });
      print(res);
      // Get.snackbar(res, "");
    } catch (e) {
      print(e);
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
    }
  }
}
