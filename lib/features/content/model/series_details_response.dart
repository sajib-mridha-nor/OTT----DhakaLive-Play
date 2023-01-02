import 'package:dhakalive/features/content/model/Related_contents.dart';

class SeriesDetailsResponse {
  SeriesDetailsResponse({
    bool? success,
    Content? data,
  }) {
    _success = success;
    _data = data;
  }

  SeriesDetailsResponse.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Content.fromJson(json['data']) : null;
  }
  bool? _success;
  Content? _data;
  SeriesDetailsResponse copyWith({
    bool? success,
    Content? data,
  }) =>
      SeriesDetailsResponse(
        success: success ?? _success,
        data: data ?? _data,
      );
  bool? get success => _success;
  Content? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

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
    String? avgRating,
    Images? images,
    List<Categories>? categories,
    List<Genres>? genres,
    dynamic videos,
    List<RelatedContents>? relatedContents,
    List<Season>? seasons,
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
    _avgRating = avgRating;
    _images = images;
    _categories = categories;
    _genres = genres;
    _videos = videos;
    _relatedContents = relatedContents;
    _seasons = seasons;
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
    _avgRating = json['avg_rating'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _videos = json['videos'];
    if (json['seasons'] != null) {
      _seasons = [];
      json['seasons'].forEach((v) {
        _seasons?.add(Season.fromJson(v));
      });
    }
    if (json['related_contents'] != null) {
      _relatedContents = [];
      json['related_contents'].forEach((v) {
        _relatedContents?.add(RelatedContents.fromJson(v));
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
  String? _avgRating;
  Images? _images;
  List<Categories>? _categories;
  List<Genres>? _genres;
  dynamic _videos;
  List<RelatedContents>? _relatedContents;
  List<Season>? _seasons;
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
    String? avgRating,
    Images? images,
    List<Categories>? categories,
    List<Genres>? genres,
    dynamic videos,
    List<RelatedContents>? relatedContents,
    List<Season>? seasons,
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
        avgRating: avgRating ?? _avgRating,
        images: images ?? _images,
        categories: categories ?? _categories,
        genres: genres ?? _genres,
        videos: videos ?? _videos,
        seasons: seasons ?? _seasons,
        relatedContents: relatedContents ?? _relatedContents,
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
  String? get avgRating => _avgRating;
  Images? get images => _images;
  List<Categories>? get categories => _categories;
  List<Genres>? get genres => _genres;
  dynamic get videos => _videos;
  List<RelatedContents>? get relatedContents => _relatedContents;
  List<Season>? get seasons => _seasons;

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
    map['avg_rating'] = _avgRating;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['videos'] = _videos;
    if (_seasons != null) {
      map['related_contents'] =
          _relatedContents?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map['seasons'] = _seasons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Season {
  Season({
    int? id,
    String? title,
    String? description,
    String? slugEn,
    String? trailer,
    String? releaseDate,
    String? order,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    String? avgRating,
    Images? images,
    List<Episode>? episodes,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _slugEn = slugEn;
    _trailer = trailer;
    _releaseDate = releaseDate;
    _order = order;
    _isPremium = isPremium;
    _isDownloadable = isDownloadable;
    _isPublished = isPublished;
    _isFeatured = isFeatured;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _avgRating = avgRating;
    _images = images;
    _episodes = episodes;
  }

  Season.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _slugEn = json['slug_en'];
    _trailer = json['trailer'];
    _releaseDate = json['release_date'];
    _order = json['order'];
    _isPremium = json['is_premium'];
    _isDownloadable = json['is_downloadable'];
    _isPublished = json['is_published'];
    _isFeatured = json['is_featured'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _avgRating = json['avg_rating'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    if (json['episodes'] != null) {
      _episodes = [];
      json['episodes'].forEach((v) {
        _episodes?.add(Episode.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _description;
  String? _slugEn;
  String? _trailer;
  String? _releaseDate;
  String? _order;
  bool? _isPremium;
  bool? _isDownloadable;
  bool? _isPublished;
  bool? _isFeatured;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  String? _avgRating;
  Images? _images;
  List<Episode>? _episodes;
  Season copyWith({
    int? id,
    String? title,
    String? description,
    String? slugEn,
    String? trailer,
    String? releaseDate,
    String? order,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    String? avgRating,
    Images? images,
    List<Episode>? episodes,
  }) =>
      Season(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        slugEn: slugEn ?? _slugEn,
        trailer: trailer ?? _trailer,
        releaseDate: releaseDate ?? _releaseDate,
        order: order ?? _order,
        isPremium: isPremium ?? _isPremium,
        isDownloadable: isDownloadable ?? _isDownloadable,
        isPublished: isPublished ?? _isPublished,
        isFeatured: isFeatured ?? _isFeatured,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        avgRating: avgRating ?? _avgRating,
        images: images ?? _images,
        episodes: episodes ?? _episodes,
      );
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get slugEn => _slugEn;
  String? get trailer => _trailer;
  String? get releaseDate => _releaseDate;
  String? get order => _order;
  bool? get isPremium => _isPremium;
  bool? get isDownloadable => _isDownloadable;
  bool? get isPublished => _isPublished;
  bool? get isFeatured => _isFeatured;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get avgRating => _avgRating;
  Images? get images => _images;
  List<Episode>? get episodes => _episodes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['slug_en'] = _slugEn;
    map['trailer'] = _trailer;
    map['release_date'] = _releaseDate;
    map['order'] = _order;
    map['is_premium'] = _isPremium;
    map['is_downloadable'] = _isDownloadable;
    map['is_published'] = _isPublished;
    map['is_featured'] = _isFeatured;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['avg_rating'] = _avgRating;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_episodes != null) {
      map['episodes'] = _episodes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Episode {
  Episode({
    int? id,
    String? title,
    String? description,
    String? order,
    String? releaseDate,
    bool? isLast,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    String? avgRating,
    Images? images,
    Source? source,
    Meta? meta,
    Channel? channel,
    List<Categories>? categories,
    List<Genres>? genres,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _order = order;
    _releaseDate = releaseDate;
    _isLast = isLast;
    _isPremium = isPremium;
    _isDownloadable = isDownloadable;
    _isPublished = isPublished;
    _isFeatured = isFeatured;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _views = views;
    _avgRating = avgRating;
    _images = images;
    _source = source;
    _meta = meta;
    _channel = channel;
    _categories = categories;
    _genres = genres;
  }

  Episode.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _order = json['order'];
    _releaseDate = json['release_date'];
    _isLast = json['is_last'];
    _isPremium = json['is_premium'];
    _isDownloadable = json['is_downloadable'];
    _isPublished = json['is_published'];
    _isFeatured = json['is_featured'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _views = json['views'];
    _avgRating = json['avg_rating'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _description;
  String? _order;
  String? _releaseDate;
  bool? _isLast;
  bool? _isPremium;
  bool? _isDownloadable;
  bool? _isPublished;
  bool? _isFeatured;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  int? _views;
  String? _avgRating;
  Images? _images;
  Source? _source;
  Meta? _meta;
  Channel? _channel;
  List<Categories>? _categories;
  List<Genres>? _genres;
  Episode copyWith({
    int? id,
    String? title,
    String? description,
    String? order,
    String? releaseDate,
    bool? isLast,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    String? avgRating,
    Images? images,
    Source? source,
    Meta? meta,
    Channel? channel,
    List<Categories>? categories,
    List<Genres>? genres,
  }) =>
      Episode(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        order: order ?? _order,
        releaseDate: releaseDate ?? _releaseDate,
        isLast: isLast ?? _isLast,
        isPremium: isPremium ?? _isPremium,
        isDownloadable: isDownloadable ?? _isDownloadable,
        isPublished: isPublished ?? _isPublished,
        isFeatured: isFeatured ?? _isFeatured,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        views: views ?? _views,
        avgRating: avgRating ?? _avgRating,
        images: images ?? _images,
        source: source ?? _source,
        meta: meta ?? _meta,
        channel: channel ?? _channel,
        categories: categories ?? _categories,
        genres: genres ?? _genres,
      );
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get order => _order;
  String? get releaseDate => _releaseDate;
  bool? get isLast => _isLast;
  bool? get isPremium => _isPremium;
  bool? get isDownloadable => _isDownloadable;
  bool? get isPublished => _isPublished;
  bool? get isFeatured => _isFeatured;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get views => _views;
  String? get avgRating => _avgRating;
  Images? get images => _images;
  Source? get source => _source;
  Meta? get meta => _meta;
  Channel? get channel => _channel;
  List<Categories>? get categories => _categories;
  List<Genres>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['order'] = _order;
    map['release_date'] = _releaseDate;
    map['is_last'] = _isLast;
    map['is_premium'] = _isPremium;
    map['is_downloadable'] = _isDownloadable;
    map['is_published'] = _isPublished;
    map['is_featured'] = _isFeatured;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['views'] = _views;
    map['avg_rating'] = _avgRating;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_channel != null) {
      map['channel'] = _channel?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Genres {
  Genres({
    int? id,
    String? name,
    dynamic slugEn,
    Images? images,
    bool? isPublished,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slugEn = slugEn;
    _images = images;
    _isPublished = isPublished;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Genres.fromJson(dynamic json) {
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
  dynamic _slugEn;
  Images? _images;
  bool? _isPublished;
  String? _createdAt;
  String? _updatedAt;
  Genres copyWith({
    int? id,
    String? name,
    dynamic slugEn,
    Images? images,
    bool? isPublished,
    String? createdAt,
    String? updatedAt,
  }) =>
      Genres(
        id: id ?? _id,
        name: name ?? _name,
        slugEn: slugEn ?? _slugEn,
        images: images ?? _images,
        isPublished: isPublished ?? _isPublished,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get name => _name;
  dynamic get slugEn => _slugEn;
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

class Categories {
  Categories({
    int? id,
    String? name,
    String? slugEn,
    Images? images,
    bool? isPublished,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slugEn = slugEn;
    _images = images;
    _isPublished = isPublished;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Categories.fromJson(dynamic json) {
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
  Categories copyWith({
    int? id,
    String? name,
    String? slugEn,
    Images? images,
    bool? isPublished,
    String? createdAt,
    String? updatedAt,
  }) =>
      Categories(
        id: id ?? _id,
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

class Channel {
  Channel({
    int? id,
    String? name,
    String? biography,
    String? description,
    bool? isVerified,
    String? createdAt,
    String? updatedAt,
    Images? images,
    List<Video>? videos,
  }) {
    _id = id;
    _name = name;
    _biography = biography;
    _description = description;
    _isVerified = isVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _images = images;
    _videos = videos;
  }

  Channel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _biography = json['biography'];
    _description = json['description'];
    _isVerified = json['is_verified'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    if (json['videos'] != null) {
      _videos = [];
      json['videos'].forEach((v) {
        _videos?.add(Video.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _biography;
  String? _description;
  bool? _isVerified;
  String? _createdAt;
  String? _updatedAt;
  Images? _images;
  List<Video>? _videos;
  Channel copyWith({
    int? id,
    String? name,
    String? biography,
    String? description,
    bool? isVerified,
    String? createdAt,
    String? updatedAt,
    Images? images,
    List<Video>? videos,
  }) =>
      Channel(
        id: id ?? _id,
        name: name ?? _name,
        biography: biography ?? _biography,
        description: description ?? _description,
        isVerified: isVerified ?? _isVerified,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        images: images ?? _images,
        videos: videos ?? _videos,
      );
  int? get id => _id;
  String? get name => _name;
  String? get biography => _biography;
  String? get description => _description;
  bool? get isVerified => _isVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Images? get images => _images;
  List<Video>? get videos => _videos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['biography'] = _biography;
    map['description'] = _description;
    map['is_verified'] = _isVerified;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_videos != null) {
      map['videos'] = _videos?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Video {
  Video({
    int? id,
    String? title,
    String? description,
    String? order,
    String? releaseDate,
    bool? isLast,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    Images? images,
    Source? source,
    Meta? meta,
    List<Categories>? categories,
    List<Genres>? genres,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _order = order;
    _releaseDate = releaseDate;
    _isLast = isLast;
    _isPremium = isPremium;
    _isDownloadable = isDownloadable;
    _isPublished = isPublished;
    _isFeatured = isFeatured;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _views = views;
    _images = images;
    _source = source;
    _meta = meta;
    _categories = categories;
    _genres = genres;
  }

  Video.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _order = json['order'];
    _releaseDate = json['release_date'];
    _isLast = json['is_last'];
    _isPremium = json['is_premium'];
    _isDownloadable = json['is_downloadable'];
    _isPublished = json['is_published'];
    _isFeatured = json['is_featured'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _views = json['views'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
  }
  int? _id;
  String? _title;
  String? _description;
  String? _order;
  String? _releaseDate;
  bool? _isLast;
  bool? _isPremium;
  bool? _isDownloadable;
  bool? _isPublished;
  bool? _isFeatured;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  int? _views;
  Images? _images;
  Source? _source;
  Meta? _meta;
  List<Categories>? _categories;
  List<Genres>? _genres;
  Video copyWith({
    int? id,
    String? title,
    String? description,
    String? order,
    String? releaseDate,
    bool? isLast,
    bool? isPremium,
    bool? isDownloadable,
    bool? isPublished,
    bool? isFeatured,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    int? views,
    Images? images,
    Source? source,
    Meta? meta,
    List<Categories>? categories,
    List<Genres>? genres,
  }) =>
      Video(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        order: order ?? _order,
        releaseDate: releaseDate ?? _releaseDate,
        isLast: isLast ?? _isLast,
        isPremium: isPremium ?? _isPremium,
        isDownloadable: isDownloadable ?? _isDownloadable,
        isPublished: isPublished ?? _isPublished,
        isFeatured: isFeatured ?? _isFeatured,
        isActive: isActive ?? _isActive,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        views: views ?? _views,
        images: images ?? _images,
        source: source ?? _source,
        meta: meta ?? _meta,
        categories: categories ?? _categories,
        genres: genres ?? _genres,
      );
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get order => _order;
  String? get releaseDate => _releaseDate;
  bool? get isLast => _isLast;
  bool? get isPremium => _isPremium;
  bool? get isDownloadable => _isDownloadable;
  bool? get isPublished => _isPublished;
  bool? get isFeatured => _isFeatured;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get views => _views;
  Images? get images => _images;
  Source? get source => _source;
  Meta? get meta => _meta;
  List<Categories>? get categories => _categories;
  List<Genres>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['order'] = _order;
    map['release_date'] = _releaseDate;
    map['is_last'] = _isLast;
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
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Meta {
  Meta({
    String? id,
    String? width,
    String? height,
    String? preview,
    String? duration,
    String? fileName,
    String? fileSize,
    String? fileType,
    String? thumbnail,
    String? downloadLink,
  }) {
    _id = id;
    _width = width;
    _height = height;
    _preview = preview;
    _duration = duration;
    _fileName = fileName;
    _fileSize = fileSize;
    _fileType = fileType;
    _thumbnail = thumbnail;
    _downloadLink = downloadLink;
  }

  Meta.fromJson(dynamic json) {
    _id = json['id'];
    _width = json['width'];
    _height = json['height'];
    _preview = json['preview'];
    _duration = json['duration'];
    _fileName = json['fileName'];
    _fileSize = json['fileSize'];
    _fileType = json['fileType'];
    _thumbnail = json['thumbnail'];
    _downloadLink = json['downloadLink'];
  }
  String? _id;
  String? _width;
  String? _height;
  String? _preview;
  String? _duration;
  String? _fileName;
  String? _fileSize;
  String? _fileType;
  String? _thumbnail;
  String? _downloadLink;
  Meta copyWith({
    String? id,
    String? width,
    String? height,
    String? preview,
    String? duration,
    String? fileName,
    String? fileSize,
    String? fileType,
    String? thumbnail,
    String? downloadLink,
  }) =>
      Meta(
        id: id ?? _id,
        width: width ?? _width,
        height: height ?? _height,
        preview: preview ?? _preview,
        duration: duration ?? _duration,
        fileName: fileName ?? _fileName,
        fileSize: fileSize ?? _fileSize,
        fileType: fileType ?? _fileType,
        thumbnail: thumbnail ?? _thumbnail,
        downloadLink: downloadLink ?? _downloadLink,
      );
  String? get id => _id;
  String? get width => _width;
  String? get height => _height;
  String? get preview => _preview;
  String? get duration => _duration;
  String? get fileName => _fileName;
  String? get fileSize => _fileSize;
  String? get fileType => _fileType;
  String? get thumbnail => _thumbnail;
  String? get downloadLink => _downloadLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['width'] = _width;
    map['height'] = _height;
    map['preview'] = _preview;
    map['duration'] = _duration;
    map['fileName'] = _fileName;
    map['fileSize'] = _fileSize;
    map['fileType'] = _fileType;
    map['thumbnail'] = _thumbnail;
    map['downloadLink'] = _downloadLink;
    return map;
  }
}

class Source {
  Source({
    String? name,
    String? link,
  }) {
    _name = name;
    _link = link;
  }

  Source.fromJson(dynamic json) {
    _name = json['name'];
    _link = json['link'];
  }
  String? _name;
  String? _link;
  Source copyWith({
    String? name,
    String? link,
  }) =>
      Source(
        name: name ?? _name,
        link: link ?? _link,
      );
  String? get name => _name;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['link'] = _link;
    return map;
  }
}
