import 'package:dhakalive/features/content/model/content_details_response.dart';
import 'package:dhakalive/features/content/model/content_details_responsee.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PlaylistContentController extends GetxController
    with StateMixin<ContentDetails> {
  final dioClient = DioClient(BASE_URL, Dio());
  final id = Get.arguments["id"];
  // final id = 12;
  final selectedVideo = Rxn<Video>();

  @override
  void onInit() {
    getContentDetails();
    super.onInit();
  }

  void getContentDetails() async {
    try {
      change(null, status: RxStatus.loading());
      final contentDetailsRes = await dioClient.get("contents/$id");

      final contentDetails =
          ContentDetailsResponse.fromJson(contentDetailsRes).data;
      selectedVideo(contentDetails?.videos?[0]);
      change(contentDetails, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}
