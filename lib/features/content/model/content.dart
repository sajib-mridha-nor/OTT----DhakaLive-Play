import 'package:dhakalive/features/content/model/Genres.dart';

class Content {
  Content({
    String? type,
    int? id,
    String? title,
    String? description,
    String? trailer,
    String? releaseDate,
    bool? isSeries,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    List<Genres>? genres,
    Images? images,
  }) {
    _type = type;
    _id = id;
    _title = title;
    _description = description;
    _trailer = trailer;
    _releaseDate = releaseDate;
    _isSeries = isSeries;
    _isPremium = isPremium;
    _isDownloadable = isDownloadable;
    _isPublished = isPublished;
    _isFeatured = isFeatured;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _views = views;
    _images = images;
    _genres = genres;
  }

  Content.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _trailer = json['trailer'];
    _releaseDate = json['release_date'];
    _isSeries = json['is_series'];
    _isPremium = json['is_premium'];
    _isDownloadable = json['is_downloadable'];
    _isPublished = json['is_published'];
    _isFeatured = json['is_featured'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _views = json['views'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
  }
  String? _type;
  int? _id;
  String? _title;
  String? _description;
  String? _trailer;
  String? _releaseDate;
  bool? _isSeries;
  bool? _isPremium;
  bool? _isDownloadable;
  bool? _isPublished;
  bool? _isFeatured;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  int? _views;
  Images? _images;
  List<Genres>? _genres;
  Content copyWith({
    String? type,
    int? id,
    String? title,
    String? description,
    String? trailer,
    String? releaseDate,
    bool? isSeries,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    Images? images,
    List<Genres>? genres,
  }) =>
      Content(
        type: type ?? _type,
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        trailer: trailer ?? _trailer,
        releaseDate: releaseDate ?? _releaseDate,
        isSeries: isSeries ?? _isSeries,
        isPremium: isPremium ?? _isPremium,
        isDownloadable: isDownloadable ?? _isDownloadable,
        isPublished: isPublished ?? _isPublished,
        isFeatured: isFeatured ?? _isFeatured,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        views: views ?? _views,
        images: images ?? _images,
        genres: genres ?? _genres,
      );
  String? get type => _type;
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get trailer => _trailer;
  String? get releaseDate => _releaseDate;
  bool? get isSeries => _isSeries;
  bool? get isPremium => _isPremium;
  bool? get isDownloadable => _isDownloadable;
  bool? get isPublished => _isPublished;
  bool? get isFeatured => _isFeatured;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get views => _views;
  Images? get images => _images;
  List<Genres>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['trailer'] = _trailer;
    map['release_date'] = _releaseDate;
    map['is_series'] = _isSeries;
    map['is_premium'] = _isPremium;
    map['is_downloadable'] = _isDownloadable;
    map['is_published'] = _isPublished;
    map['is_featured'] = _isFeatured;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['views'] = _views;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class Images {
  Images({
    String? thumbnail,
    String? cover,
  }) {
    _thumbnail = thumbnail;
    _cover = cover;
  }

  Images.fromJson(dynamic json) {
    _thumbnail = json['thumbnail'];
    _cover = json['cover'];
  }
  String? _thumbnail;
  String? _cover;
  Images copyWith({
    String? thumbnail,
    String? cover,
  }) =>
      Images(
        thumbnail: thumbnail ?? _thumbnail,
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
