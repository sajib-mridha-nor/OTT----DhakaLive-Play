class Tv {
  Tv({
    int? id,
    String? name,
    String? liveLink,
    String? description,
    String? thumbanil,
    String? cover,
    String? status,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _name = name;
    _liveLink = liveLink;
    _description = description;
    _thumbanil = thumbanil;
    _cover = cover;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Tv.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _liveLink = json['live_link'];
    _description = json['description'];
    _thumbanil = json['thumbanil'];
    _cover = json['cover'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _liveLink;
  String? _description;
  String? _thumbanil;
  String? _cover;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  Tv copyWith({  int? id,
    String? name,
    String? liveLink,
    String? description,
    String? thumbanil,
    String? cover,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) => Tv(  id: id ?? _id,
    name: name ?? _name,
    liveLink: liveLink ?? _liveLink,
    description: description ?? _description,
    thumbanil: thumbanil ?? _thumbanil,
    cover: cover ?? _cover,
    status: status ?? _status,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  int? get id => _id;
  String? get name => _name;
  String? get liveLink => _liveLink;
  String? get description => _description;
  String? get thumbanil => _thumbanil;
  String? get cover => _cover;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['live_link'] = _liveLink;
    map['description'] = _description;
    map['thumbanil'] = _thumbanil;
    map['cover'] = _cover;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}