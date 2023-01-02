/// success : true
/// data : [{"name":"Chanchal Chowdhury","profile_picture":"https://ezze.dev/dhakaliveott/storage/211/1474821718_3.jpg"},{"name":"H P M Sheikh Hasina","profile_picture":"https://ezze.dev/dhakaliveott/storage/212/THIRD-OPTION-PM05_pht-YeasinKabirJoy_3000px-e1558643977702.jpg"},{"name":"Mosharraf Karim","profile_picture":"https://ezze.dev/dhakaliveott/storage/213/MosharrafKarim.jpg"},{"name":"Nazifa Tushi","profile_picture":"https://ezze.dev/dhakaliveott/storage/214/_d_2215_0.jpg"},{"name":"Zunaid Ahmed Palak MP","profile_picture":"https://ezze.dev/dhakaliveott/storage/217/image-505283-1641326604.jpg"}]

class Cast {
  Cast({
      this.success, 
      this.data,});

  Cast.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Chanchal Chowdhury"
/// profile_picture : "https://ezze.dev/dhakaliveott/storage/211/1474821718_3.jpg"

class Data {
  Data({
      this.name, 
      this.profilePicture,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
  }
  String? name;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['profile_picture'] = profilePicture;
    return map;
  }

}