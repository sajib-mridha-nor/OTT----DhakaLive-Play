/// success : true
/// data : [{"id":4,"name":"Document","slug_en":"document","images":{"thumbnail":"http://ezze.dev/dhakaliveott/storage/39/images.jpeg","cover":"http://ezze.dev/dhakaliveott/storage/40/850х550-ott-advertising.png"},"is_published":true,"created_at":"2022-06-19T06:14:19.000000Z","updated_at":"2022-06-19T06:14:19.000000Z"},{"id":3,"name":"Motivational","slug_en":"motivational","images":{"thumbnail":"http://ezze.dev/dhakaliveott/storage/37/850х550-ott-advertising.png","cover":"http://ezze.dev/dhakaliveott/storage/38/images.jpeg"},"is_published":true,"created_at":"2022-06-19T06:14:03.000000Z","updated_at":"2022-06-19T06:14:03.000000Z"},{"id":2,"name":"Natok","slug_en":"natok","images":{"thumbnail":"http://ezze.dev/dhakaliveott/storage/35/images1.jpeg","cover":"http://ezze.dev/dhakaliveott/storage/36/images.jpeg"},"is_published":true,"created_at":"2022-06-19T06:13:45.000000Z","updated_at":"2022-06-19T06:13:45.000000Z"},{"id":1,"name":"Shortfilm","slug_en":"shortfilm","images":{"thumbnail":"http://ezze.dev/dhakaliveott/storage/33/images.jpeg","cover":"http://ezze.dev/dhakaliveott/storage/34/images1.jpeg"},"is_published":true,"created_at":"2022-06-19T06:12:59.000000Z","updated_at":"2022-06-19T06:12:59.000000Z"}]

class CategoryResponse {
  CategoryResponse({
      bool? success, 
      List<Category>? data,}){
    _success = success;
    _data = data;
}

  CategoryResponse.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Category>? _data;
CategoryResponse copyWith({  bool? success,
  List<Category>? data,
}) => CategoryResponse(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Category>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// name : "Document"
/// slug_en : "document"
/// images : {"thumbnail":"http://ezze.dev/dhakaliveott/storage/39/images.jpeg","cover":"http://ezze.dev/dhakaliveott/storage/40/850х550-ott-advertising.png"}
/// is_published : true
/// created_at : "2022-06-19T06:14:19.000000Z"
/// updated_at : "2022-06-19T06:14:19.000000Z"

class Category {
  Category({
      int? id, 
      String? name, 
      String? slugEn, 
      Images? images, 
      bool? isPublished, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _slugEn = slugEn;
    _images = images;
    _isPublished = isPublished;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slugEn = json['slug_en'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _isPublished = json['is_published'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _slugEn;
  Images? _images;
  bool? _isPublished;
  String? _createdAt;
  String? _updatedAt;
Category copyWith({  int? id,
  String? name,
  String? slugEn,
  Images? images,
  bool? isPublished,
  String? createdAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  slugEn: slugEn ?? _slugEn,
  images: images ?? _images,
  isPublished: isPublished ?? _isPublished,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get slugEn => _slugEn;
  Images? get images => _images;
  bool? get isPublished => _isPublished;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug_en'] = _slugEn;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    map['is_published'] = _isPublished;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// thumbnail : "http://ezze.dev/dhakaliveott/storage/39/images.jpeg"
/// cover : "http://ezze.dev/dhakaliveott/storage/40/850х550-ott-advertising.png"

class Images {
  Images({
      String? thumbnail, 
      String? cover,}){
    _thumbnail = thumbnail;
    _cover = cover;
}

  Images.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _cover = json['cover'];
  }
  String? _thumbnail;
  String? _cover;
Images copyWith({  String? thumbnail,
  String? cover,
}) => Images(  thumbnail: thumbnail ?? _thumbnail,
  cover: cover ?? _cover,
);
  String? get thumbnail => _thumbnail;
  String? get cover => _cover;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = _thumbnail;
    map['cover'] = _cover;
    return map;
  }

}