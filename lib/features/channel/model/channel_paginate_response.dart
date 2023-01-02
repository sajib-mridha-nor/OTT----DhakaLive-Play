class ChannelPaginateResponse {
  ChannelPaginateResponse({
      int? currentPage, 
      List<Channel>? data,
      String? firstPageUrl, 
      int? from, 
      int? lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      dynamic nextPageUrl, 
      String? path, 
      int? perPage, 
      dynamic prevPageUrl, 
      int? to, 
      int? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  ChannelPaginateResponse.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Channel.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  List<Channel>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;
ChannelPaginateResponse copyWith({  int? currentPage,
  List<Channel>? data,
  String? firstPageUrl,
  int? from,
  int? lastPage,
  String? lastPageUrl,
  List<Links>? links,
  dynamic nextPageUrl,
  String? path,
  int? perPage,
  dynamic prevPageUrl,
  int? to,
  int? total,
}) => ChannelPaginateResponse(  currentPage: currentPage ?? _currentPage,
  data: data ?? _data,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  links: links ?? _links,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  perPage: perPage ?? _perPage,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  int? get currentPage => _currentPage;
  List<Channel>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

class Links {
  Links({
      dynamic url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
Links copyWith({  dynamic url,
  String? label,
  bool? active,
}) => Links(  url: url ?? _url,
  label: label ?? _label,
  active: active ?? _active,
);
  dynamic get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
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
      Images? images,}){
    _id = id;
    _name = name;
    _biography = biography;
    _description = description;
    _isVerified = isVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _images = images;
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
  }
  int? _id;
  String? _name;
  String? _biography;
  String? _description;
  bool? _isVerified;
  String? _createdAt;
  String? _updatedAt;
  Images? _images;
Channel copyWith({  int? id,
  String? name,
  String? biography,
  String? description,
  bool? isVerified,
  String? createdAt,
  String? updatedAt,
  Images? images,
}) => Channel(  id: id ?? _id,
  name: name ?? _name,
  biography: biography ?? _biography,
  description: description ?? _description,
  isVerified: isVerified ?? _isVerified,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  images: images ?? _images,
);
  int? get id => _id;
  String? get name => _name;
  String? get biography => _biography;
  String? get description => _description;
  bool? get isVerified => _isVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Images? get images => _images;

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