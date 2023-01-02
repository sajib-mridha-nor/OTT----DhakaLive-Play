class CastDetailsModel {
  int? id;
  String? name;
  String? slugEn;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Records>? records;

  CastDetailsModel(
      {this.id,
      this.name,
      this.slugEn,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.records});

  CastDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slugEn = json['slug_en'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug_en'] = this.slugEn;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  int? id;
  String? unqId;
  String? contentId;
  Null? sequenceId;
  Null? chapterId;
  String? channelId;
  String? sourceId;
  String? videoId;
  String? title;
  String? description;
  String? order;
  String? releaseDate;
  String? meta;
  String? isLast;
  String? isPremium;
  String? isDownloadable;
  String? isPublish;
  String? isFeature;
  String? isActive;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Records(
      {this.id,
      this.unqId,
      this.contentId,
      this.sequenceId,
      this.chapterId,
      this.channelId,
      this.sourceId,
      this.videoId,
      this.title,
      this.description,
      this.order,
      this.releaseDate,
      this.meta,
      this.isLast,
      this.isPremium,
      this.isDownloadable,
      this.isPublish,
      this.isFeature,
      this.isActive,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unqId = json['unq_id'];
    contentId = json['content_id'];
    sequenceId = json['sequence_id'];
    chapterId = json['chapter_id'];
    channelId = json['channel_id'];
    sourceId = json['source_id'];
    videoId = json['video_id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    releaseDate = json['release_date'];
    meta = json['meta'];
    isLast = json['is_last'];
    isPremium = json['is_premium'];
    isDownloadable = json['is_downloadable'];
    isPublish = json['is_publish'];
    isFeature = json['is_feature'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unq_id'] = this.unqId;
    data['content_id'] = this.contentId;
    data['sequence_id'] = this.sequenceId;
    data['chapter_id'] = this.chapterId;
    data['channel_id'] = this.channelId;
    data['source_id'] = this.sourceId;
    data['video_id'] = this.videoId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['release_date'] = this.releaseDate;
    data['meta'] = this.meta;
    data['is_last'] = this.isLast;
    data['is_premium'] = this.isPremium;
    data['is_downloadable'] = this.isDownloadable;
    data['is_publish'] = this.isPublish;
    data['is_feature'] = this.isFeature;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? castId;
  String? recordId;

  Pivot({this.castId, this.recordId});

  Pivot.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    recordId = json['record_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['record_id'] = this.recordId;
    return data;
  }
}
