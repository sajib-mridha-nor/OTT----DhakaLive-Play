/// id : 14
/// title : "Taqdeer Review – A Slow Paced Gripping Thriller That Ends With A Whimper"
/// description : "<div class=\"crew-cast\">\r\n<div class=\"crew\">\r\n<div class=\"role\">DIRECTOR</div>\r\n<div class=\"people\">সৈয়দ আহমেদ স্বকী</div>\r\n</div>\r\n<div class=\"crew\">\r\n<div class=\"role\">STARRING</div>\r\n<div class=\"people\">চঞ্চল চৌধুরী, মনোজ কুমার প্রামাণিক, সানজিদা প্রীতি, সোহেল মন্ডল</div>\r\n</div>\r\n</div>\r\n<div class=\"desc\">লাশবাহী গাড়িতে বেওয়ারিশ এক নারীদেহ, যা একের পর এক ঘটনায় ক্রমশ বিপজ্জনক করে তোলে ড্রাইভার তকদিরের ভাগ্যের লিখন।</div>\r\n<div class=\"desc\">&nbsp;</div>\r\n<div class=\"desc\">Freezer van driver Taqdeer spirals into a dark game of destiny after he finds the unclaimed dead body of a woman in his truck.</div>"
/// images : {"thumbnail":"https://ezze.dev/dhakaliveott/storage/181/taqdeer.jpg"}

class RelatedContents {
  RelatedContents({
      this.id, 
      this.title, 
      this.description, 
      this.images,});

  RelatedContents.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }
  int? id;
  String? title;
  String? description;
  Images? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    if (images != null) {
      map['images'] = images?.toJson();
    }
    return map;
  }

}

/// thumbnail : "https://ezze.dev/dhakaliveott/storage/181/taqdeer.jpg"

class Images {
  Images({
      this.thumbnail,});

  Images.fromJson(dynamic json) {
    thumbnail = json['thumbnail'];
  }
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail'] = thumbnail;
    return map;
  }

}