 

class Genres {
  Genres({
      this.id, 
      this.name, 
      this.slugEn, 
      this.description, 
      this.images, 
      this.isPublished,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slugEn = json['slug_en'];
    description = json['description'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    isPublished = json['is_published'];
  }
  int? id;
  String? name;
  dynamic? slugEn;
  String? description;
  Images? images;
  bool? isPublished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug_en'] = slugEn;
    map['description'] = description;
    if (images != null) {
      map['images'] = images?.toJson();
    }
    map['is_published'] = isPublished;
    return map;
  }

}
class Images {
  Images({
      this.thumbnail, 
      this.cover,});

  Images.fromJson(dynamic json) {
    thumbnail = json['thumbnail'];
    cover = json['cover'];
  }
  String? thumbnail;
  String? cover;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = thumbnail;
    map['cover'] = cover;
    return map;
  }

}