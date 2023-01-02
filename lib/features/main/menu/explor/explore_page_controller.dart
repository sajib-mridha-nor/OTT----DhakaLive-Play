
import 'package:dhakalive/features/category/model/category_response.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ExplorePageController extends GetxController
    with StateMixin<List<Category>> {
  final dioClient = DioClient(BASE_URL, Dio());

  @override
  void onInit() {
    getExploreData();
    getExploreData();
    super.onInit();
  }

  void getExploreData() async {
    try {
      change(null, status: RxStatus.loading());
      final res = await dioClient.get("categories");
      final list = CategoryResponse.fromJson(res).data ?? [];
      change(list, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}
