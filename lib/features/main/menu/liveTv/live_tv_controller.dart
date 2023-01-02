import 'package:dhakalive/features/livetv/model/live_tv_response.dart';
import 'package:dhakalive/features/livetv/model/tv_category.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LiveTvPageController extends GetxController with StateMixin<List<TvCategory>> {

  final dioClient = DioClient(BASE_URL, Dio());


  @override
  void onInit() {
    getTVSData();
    super.onInit();
  }

  void getTVSData() async {
    try{
      change(null, status: RxStatus.loading());
      final res = await dioClient.get("tvs");
      final list = LiveTvResponse.fromJson(res).response ?? [];
      change(list, status: RxStatus.success());
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}