import 'package:dhakalive/features/livetv/model/tv_category.dart';

class LiveTvResponse {
  LiveTvResponse({
      bool? error, 
      String? message, 
      List<TvCategory>? response,}){
    _error = error;
    _message = message;
    _response = response;
}

  LiveTvResponse.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(TvCategory.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<TvCategory>? _response;
LiveTvResponse copyWith({  bool? error,
  String? message,
  List<TvCategory>? response,
}) => LiveTvResponse(  error: error ?? _error,
  message: message ?? _message,
  response: response ?? _response,
);
  bool? get error => _error;
  String? get message => _message;
  List<TvCategory>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// name : "Sports"
/// type : "TV"
/// thumbnail : "https://ezze.dev/dhakalive/storage/48/images.jpeg"
/// cover : "https://ezze.dev/dhakalive/storage/49/images.jpeg"
/// status : "Active"
/// created_at : "2022-06-14T10:59:47.000000Z"
/// updated_at : "2022-06-14T11:04:37.000000Z"
/// tvs : [{"id":1,"name":"Gazi TV","live_link":"gazi.com","description":"<p>Gazi tv description</p>","thumbanil":"https://ezze.dev/dhakalive/storage/50/images.jpeg","cover":"https://ezze.dev/dhakalive/storage/51/850х550-ott-advertising.png","status":"Active","created_at":"2022-06-14T11:54:52.000000Z","updated_at":"2022-06-14T11:54:52.000000Z"}]

/// id : 1
/// name : "Gazi TV"
/// live_link : "gazi.com"
/// description : "<p>Gazi tv description</p>"
/// thumbanil : "https://ezze.dev/dhakalive/storage/50/images.jpeg"
/// cover : "https://ezze.dev/dhakalive/storage/51/850х550-ott-advertising.png"
/// status : "Active"
/// created_at : "2022-06-14T11:54:52.000000Z"
/// updated_at : "2022-06-14T11:54:52.000000Z"

