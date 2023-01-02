class CastsModel {
  bool? success;
  List<Casts>? data;

  CastsModel({this.success, this.data});

  CastsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Casts>[];
      json['data'].forEach((v) {
        data!.add(new Casts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Casts {
  int? id;
  String? name;
  String? profilePicture;

  Casts({this.id, this.name, this.profilePicture});

  Casts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}
