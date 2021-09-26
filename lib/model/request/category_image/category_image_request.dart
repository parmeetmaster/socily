/// id : "2"
/// lang : "en,hi,"

class CategoryImageRequest {
  String? id;
  String? lang;

  CategoryImageRequest({
      this.id, 
      this.lang});

  CategoryImageRequest.fromJson(dynamic json) {
    id = json['id'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['lang'] = lang;
    return map;
  }

}