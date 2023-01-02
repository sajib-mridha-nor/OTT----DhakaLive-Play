import 'package:dhakalive/features/content/model/content_details_response.dart';
import 'package:dhakalive/features/content/model/content_details_responsee.dart';
import 'package:dhakalive/utils/constant.dart';

import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/network/dio_client.dart';

class SingleContentController extends GetxController
    with StateMixin<ContentDetails> {
  final dioClient = DioClient.instance;

  final id = Get.arguments["id"];
  double? rating;
  late ContentDetails? contentDetails;

  @override
  void onInit() {
    getContentDetails();
    super.onInit();
  }

  void getContentDetails() async {
    try {
      change(null, status: RxStatus.loading());
      final contentDetailsRes = await dioClient.get("contents/$id");

      contentDetails = ContentDetailsResponse.fromJson(contentDetailsRes).data;

      change(contentDetails, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }

  void ratingVideo(rating,id,contentType) async {
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
