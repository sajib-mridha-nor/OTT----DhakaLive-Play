import 'package:dhakalive/features/content/model/cast_list_model.dart';
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CastPageController extends GetxController with StateMixin<List<Casts>> {
  final dioClient = DioClient(BASE_URL, Dio());
  static const _pageSize = 15;

  // final PagingController<int, Channel> pagingController =
  //     PagingController(firstPageKey: 1);

  @override
  void onInit() {
    fetchPage();
    // pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.onInit();
  }

  fetchPage() async {
    try {
      change(null, status: RxStatus.loading());
      final res = await dioClient.get("/casts");
      print("z");
      final casts = CastsModel.fromJson(res).data??[];
      print(casts);

      change(casts, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      // pagingController.error = message;
    }
  }

  // @override
  // void onClose() {
  //   pagingController.dispose();
  //   super.onClose();
  // }
}
