import 'package:dhakalive/features/content/model/series_details_response2.dart'
    as s;
import 'package:dhakalive/utils/constant.dart';
import 'package:dhakalive/utils/network/dio_client.dart';
import 'package:dhakalive/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SeriesContentController extends GetxController
    with StateMixin<s.RelatedContents> {
  final dioClient = DioClient(BASE_URL, Dio());
  final id = Get.arguments["id"];

  final sessions = RxList<s.Seasons>();
  final selectedSeason = Rxn<s.Seasons>();
  final selectedEpisode = Rxn<s.Episodes>();
  RxString title = "".obs;

  @override
  void onInit() {
    getContentDetails();
    super.onInit();
  }

  void filterBySeason(String? value) {
    final item = sessions.value.firstWhere((element) => element.title == value);
    if (item.episodes?.length != 0) {
      selectedSeason(item);
      selectedEpisode(item.episodes?[0]);
    } else {
      selectedEpisode(null);
      selectedSeason(null);
    }
  }

  void getContentDetails() async {
    try {
      change(null, status: RxStatus.loading());

      final contentDetailsRes = await dioClient.get("contents/$id");
      // print("gg${contentDetailsRes}");

      final contentDetails =
          s.SeriesDetailsResponse2.fromJson(contentDetailsRes).seriesDetails;
      print("ll${contentDetails?.images?.cover}");
      // print("after m");

      title(contentDetails?.title);
      sessions(contentDetails?.seasons ?? []);
      selectedSeason(contentDetails?.seasons?[1]);
      selectedEpisode(contentDetails?.seasons?[1].episodes?[0]);

      change(contentDetails?.relatedContents?.first,
          status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}
