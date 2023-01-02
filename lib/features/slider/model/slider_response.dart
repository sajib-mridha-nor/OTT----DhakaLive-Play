class SliderResponse {
  SliderResponse({
      bool? success, 
      String? type, 
      List<Slider>? data,}){
    _success = success;
    _type = type;
    _data = data;
}

  SliderResponse.fromJson(dynamic json) {
    _success = json['success'];
    _type = json['type'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Slider.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _type;
  List<Slider>? _data;
SliderResponse copyWith({  bool? success,
  String? type,
  List<Slider>? data,
}) => SliderResponse(  success: success ?? _success,
  type: type ?? _type,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get type => _type;
  List<Slider>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['type'] = _type;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Slider {
  Slider({
      int? id, 
      String? title, 
      String? description, 
      bool? isPremium, 
      Images? images, 
      Meta? meta,}){
    _id = id;
    _title = title;
    _description = description;
    _isPremium = isPremium;
    _images = images;
    _meta = meta;
}

  Slider.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _isPremium = json['is_premium'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  int? _id;
  String? _title;
  String? _description;
  bool? _isPremium;
  Images? _images;
  Meta? _meta;
Slider copyWith({  int? id,
  String? title,
  String? description,
  bool? isPremium,
  Images? images,
  Meta? meta,
}) => Slider(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  isPremium: isPremium ?? _isPremium,
  images: images ?? _images,
  meta: meta ?? _meta,
);
  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  bool? get isPremium => _isPremium;
  Images? get images => _images;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['is_premium'] = _isPremium;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
      String? id, 
      String? fileName, 
      String? fileType, 
      String? duration, 
      String? fileSize, 
      String? width, 
      String? height, 
      String? thumbnail, 
      String? preview, 
      String? downloadLink,}){
    _id = id;
    _fileName = fileName;
    _fileType = fileType;
    _duration = duration;
    _fileSize = fileSize;
    _width = width;
    _height = height;
    _thumbnail = thumbnail;
    _preview = preview;
    _downloadLink = downloadLink;
}

  Meta.fromJson(dynamic json) {
    _id = json['id'];
    _fileName = json['fileName'];
    _fileType = json['fileType'];
    _duration = json['duration'];
    _fileSize = json['fileSize'];
    _width = json['width'];
    _height = json['height'];
    _thumbnail = json['thumbnail'];
    _preview = json['preview'];
    _downloadLink = json['downloadLink'];
  }
  String? _id;
  String? _fileName;
  String? _fileType;
  String? _duration;
  String? _fileSize;
  String? _width;
  String? _height;
  String? _thumbnail;
  String? _preview;
  String? _downloadLink;
Meta copyWith({  String? id,
  String? fileName,
  String? fileType,
  String? duration,
  String? fileSize,
  String? width,
  String? height,
  String? thumbnail,
  String? preview,
  String? downloadLink,
}) => Meta(  id: id ?? _id,
  fileName: fileName ?? _fileName,
  fileType: fileType ?? _fileType,
  duration: duration ?? _duration,
  fileSize: fileSize ?? _fileSize,
  width: width ?? _width,
  height: height ?? _height,
  thumbnail: thumbnail ?? _thumbnail,
  preview: preview ?? _preview,
  downloadLink: downloadLink ?? _downloadLink,
);
  String? get id => _id;
  String? get fileName => _fileName;
  String? get fileType => _fileType;
  String? get duration => _duration;
  String? get fileSize => _fileSize;
  String? get width => _width;
  String? get height => _height;
  String? get thumbnail => _thumbnail;
  String? get preview => _preview;
  String? get downloadLink => _downloadLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fileName'] = _fileName;
    map['fileType'] = _fileType;
    map['duration'] = _duration;
    map['fileSize'] = _fileSize;
    map['width'] = _width;
    map['height'] = _height;
    map['thumbnail'] = _thumbnail;
    map['preview'] = _preview;
    map['downloadLink'] = _downloadLink;
    return map;
  }

}

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