import 'package:dhakalive/features/content/model/content_details_response.dart';

class SeriesDetailsResponse2 {
  bool? success;
  SeriesDetails? seriesDetails;

  SeriesDetailsResponse2({this.success, this.seriesDetails});

  SeriesDetailsResponse2.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    seriesDetails = json['data'] != null ? new SeriesDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.seriesDetails != null) {
      data['data'] = this.seriesDetails!.toJson();
    }
    return data;
  }
}

class SeriesDetails {
  String? type;
  int? id;
  String? title;
  String? description;
  String? trailer;
  String? releaseDate;
  bool? isSeries;
  bool? isPremium;
  bool? isDownloadable;
  bool? isPublished;
  bool? isFeatured;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? views;
  String? avgRating;
  List<Reviews>? reviews;
  Images? images;
  List<Categories>? categories;
  List<Genres>? genres;
  Null? videos;
  List<Seasons>? seasons;
  List<RelatedContents>? relatedContents;

  SeriesDetails(
      {this.type,
      this.id,
      this.title,
      this.description,
      this.trailer,
      this.releaseDate,
      this.isSeries,
      this.isPremium,
      this.isDownloadable,
      this.isPublished,
      this.isFeatured,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.views,
      this.avgRating,
      this.reviews,
      this.images,
      this.categories,
      this.genres,
      this.videos,
      this.seasons,
      this.relatedContents});

  SeriesDetails.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    trailer = json['trailer'];
    releaseDate = json['release_date'];
    isSeries = json['is_series'];
    isPremium = json['is_premium'];
    isDownloadable = json['is_downloadable'];
    isPublished = json['is_published'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    views = json['views'];
    avgRating = json['avg_rating'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    videos = json['videos'];
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(new Seasons.fromJson(v));
      });
    }
    if (json['related_contents'] != null) {
      relatedContents = <RelatedContents>[];
      json['related_contents'].forEach((v) {
        relatedContents!.add(new RelatedContents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['trailer'] = this.trailer;
    data['release_date'] = this.releaseDate;
    data['is_series'] = this.isSeries;
    data['is_premium'] = this.isPremium;
    data['is_downloadable'] = this.isDownloadable;
    data['is_published'] = this.isPublished;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['views'] = this.views;
    data['avg_rating'] = this.avgRating;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['videos'] = this.videos;
    if (this.seasons != null) {
      data['seasons'] = this.seasons!.map((v) => v.toJson()).toList();
    }
    if (this.relatedContents != null) {
      data['related_contents'] =
          this.relatedContents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  User? user;
  String? rating;
  String? comments;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.user, this.rating, this.comments, this.createdAt, this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rating = json['rating'];
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['rating'] = this.rating;
    data['comments'] = this.comments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  String? name;
  String? image;

  User({this.name, this.image});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Images {
  String? thumbnail;
  String? cover;

  Images({this.thumbnail, this.cover});

  Images.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['cover'] = this.cover;
    return data;
  }
}

class Categories {
  String? name;
  String? slugEn;
  String? description;
  Images? images;
  bool? isPublished;

  Categories(
      {this.name,
      this.slugEn,
      this.description,
      this.images,
      this.isPublished});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slugEn = json['slug_en'];
    description = json['description'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    isPublished = json['is_published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug_en'] = this.slugEn;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['is_published'] = this.isPublished;
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  Null? slugEn;
  String? description;
  Images? images;
  bool? isPublished;

  Genres(
      {this.id,
      this.name,
      this.slugEn,
      this.description,
      this.images,
      this.isPublished});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slugEn = json['slug_en'];
    description = json['description'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    isPublished = json['is_published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug_en'] = this.slugEn;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['is_published'] = this.isPublished;
    return data;
  }
}

class Seasons {
  int? id;
  String? title;
  String? description;
  String? slugEn;
  String? trailer;
  String? releaseDate;
  String? order;
  bool? isPremium;
  bool? isDownloadable;
  bool? isPublished;
  bool? isFeatured;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? avgRating;
  List<Null>? reviews;
  Images? images;
  List<Episodes>? episodes;

  Seasons(
      {this.id,
      this.title,
      this.description,
      this.slugEn,
      this.trailer,
      this.releaseDate,
      this.order,
      this.isPremium,
      this.isDownloadable,
      this.isPublished,
      this.isFeatured,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.avgRating,
      this.reviews,
      this.images,
      this.episodes});

  Seasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    slugEn = json['slug_en'];
    trailer = json['trailer'];
    releaseDate = json['release_date'];
    order = json['order'];
    isPremium = json['is_premium'];
    isDownloadable = json['is_downloadable'];
    isPublished = json['is_published'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avgRating = json['avg_rating'];
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['slug_en'] = this.slugEn;
    data['trailer'] = this.trailer;
    data['release_date'] = this.releaseDate;
    data['order'] = this.order;
    data['is_premium'] = this.isPremium;
    data['is_downloadable'] = this.isDownloadable;
    data['is_published'] = this.isPublished;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['avg_rating'] = this.avgRating;
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  int? id;
  String? title;
  String? description;
  String? order;
  String? releaseDate;
  bool? isLast;
  bool? isPremium;
  bool? isDownloadable;
  bool? isPublished;
  bool? isFeatured;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? views;
  String? avgRating;
  List<Null>? reviews;
  Images? images;
  List<Null>? casts;
  Source? source;
  Meta? meta;
  Channel? channel;
  List<Categories>? categories;
  List<Genres>? genres;

  Episodes(
      {this.id,
      this.title,
      this.description,
      this.order,
      this.releaseDate,
      this.isLast,
      this.isPremium,
      this.isDownloadable,
      this.isPublished,
      this.isFeatured,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.views,
      this.avgRating,
      this.reviews,
      this.images,
      this.casts,
      this.source,
      this.meta,
      this.channel,
      this.categories,
      this.genres});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    releaseDate = json['release_date'];
    isLast = json['is_last'];
    isPremium = json['is_premium'];
    isDownloadable = json['is_downloadable'];
    isPublished = json['is_published'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    views = json['views'];
    avgRating = json['avg_rating'];
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    // if (json['casts'] != null) {
    //   casts = <Null>[];
    //   json['casts'].forEach((v) {
    //     casts!.add(new Null.fromJson(v));
    //   });
    // }
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['release_date'] = this.releaseDate;
    data['is_last'] = this.isLast;
    data['is_premium'] = this.isPremium;
    data['is_downloadable'] = this.isDownloadable;
    data['is_published'] = this.isPublished;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['views'] = this.views;
    data['avg_rating'] = this.avgRating;
    // if (this.reviews != null) {
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    // if (this.casts != null) {
    //   data['casts'] = this.casts!.map((v) => v.toJson()).toList();
    // }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.channel != null) {
      data['channel'] = this.channel!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Source {
  String? name;
  String? link;

  Source({this.name, this.link});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}

class Meta {
  String? id;
  String? fileName;
  String? fileType;
  String? duration;
  String? fileSize;
  String? width;
  String? height;
  String? thumbnail;
  String? preview;
  Null? downloadLink;

  Meta(
      {this.id,
      this.fileName,
      this.fileType,
      this.duration,
      this.fileSize,
      this.width,
      this.height,
      this.thumbnail,
      this.preview,
      this.downloadLink});

  Meta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileType = json['fileType'];
    duration = json['duration'];
    fileSize = json['fileSize'];
    width = json['width'];
    height = json['height'];
    thumbnail = json['thumbnail'];
    preview = json['preview'];
    downloadLink = json['downloadLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileType'] = this.fileType;
    data['duration'] = this.duration;
    data['fileSize'] = this.fileSize;
    data['width'] = this.width;
    data['height'] = this.height;
    data['thumbnail'] = this.thumbnail;
    data['preview'] = this.preview;
    data['downloadLink'] = this.downloadLink;
    return data;
  }
}

class Channel {
  int? id;
  String? name;
  String? biography;
  String? description;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  Images? images;
  List<Videos>? videos;

  Channel(
      {this.id,
      this.name,
      this.biography,
      this.description,
      this.isVerified,
      this.createdAt,
      this.updatedAt,
      this.images,
      this.videos});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    biography = json['biography'];
    description = json['description'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['biography'] = this.biography;
    data['description'] = this.description;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  int? id;
  String? title;
  String? description;
  String? order;
  String? releaseDate;
  bool? isLast;
  bool? isPremium;
  bool? isDownloadable;
  bool? isPublished;
  bool? isFeatured;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? views;
  Images? images;
  Source? source;
  Meta? meta;
  List<Categories>? categories;
  List<Genres>? genres;

  Videos(
      {this.id,
      this.title,
      this.description,
      this.order,
      this.releaseDate,
      this.isLast,
      this.isPremium,
      this.isDownloadable,
      this.isPublished,
      this.isFeatured,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.views,
      this.images,
      this.source,
      this.meta,
      this.categories,
      this.genres});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    releaseDate = json['release_date'];
    isLast = json['is_last'];
    isPremium = json['is_premium'];
    isDownloadable = json['is_downloadable'];
    isPublished = json['is_published'];
    isFeatured = json['is_featured'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    views = json['views'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['release_date'] = this.releaseDate;
    data['is_last'] = this.isLast;
    data['is_premium'] = this.isPremium;
    data['is_downloadable'] = this.isDownloadable;
    data['is_published'] = this.isPublished;
    data['is_featured'] = this.isFeatured;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['views'] = this.views;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedContents {
  int? id;
  String? title;
  String? description;
  Images? images;

  RelatedContents({this.id, this.title, this.description, this.images});

  RelatedContents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}
