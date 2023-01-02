
import 'package:dhakalive/features/livetv/model/tv.dart';

class TvCategory {
  TvCategory({
    int? id,
    String? name,
    String? type,
    String? thumbnail,
    String? cover,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<Tv>? tvs,}){
    _id = id;
    _name = name;
    _type = type;
    _thumbnail = thumbnail;
    _cover = cover;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _tvs = tvs;
  }

  TvCategory.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _thumbnail = json['thumbnail'];
    _cover = json['cover'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['tvs'] != null) {
      _tvs = [];
      json['tvs'].forEach((v) {
        _tvs?.add(Tv.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _type;
  String? _thumbnail;
  String? _cover;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  List<Tv>? _tvs;
  TvCategory copyWith({  int? id,
    String? name,
    String? type,
    String? thumbnail,
    String? cover,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<Tv>? tvs,
  }) => TvCategory(  id: id ?? _id,
    name: name ?? _name,
    type: type ?? _type,
    thumbnail: thumbnail ?? _thumbnail,
    cover: cover ?? _cover,
    status: status ?? _status,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    tvs: tvs ?? _tvs,
  );
  int? get id => _id;
  String? get name => _name;
  String? get type => _type;
  String? get thumbnail => _thumbnail;
  String? get cover => _cover;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Tv>? get tvs => _tvs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['thumbnail'] = _thumbnail;
    map['cover'] = _cover;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_tvs != null) {
      map['tvs'] = _tvs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
