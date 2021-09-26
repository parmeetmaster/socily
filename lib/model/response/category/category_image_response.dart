/// success : true
/// login : true
/// related_category : [{"id":"2","category":"Kirana Store","subcategory":"Service Type 3","image":"https://www.digitalraiz.com/projects/divinity/uploads/images/original/97e3ff9aba5cfd8e9b713275c0185a8d.jpg","festival":"birthday","prime_type":"Prime","active":1},{"id":"1","category":"Kirana Store","subcategory":"Service Type 3","image":"https://www.digitalraiz.com/projects/divinity/uploads/images/original/c261c2d6d6e0a82eeb77a77ef8c35aef.png","festival":"birthday","prime_type":"Prime","active":0}]

class CategoryImageResponse {
  bool? success;
  bool? login;
  List<Related_category>? relatedCategory;

  CategoryImageResponse({
      this.success, 
      this.login, 
      this.relatedCategory});

  CategoryImageResponse.fromJson(dynamic json) {
    success = json['success'];
    login = json['login'];
    if (json['related_category'] != null) {
      relatedCategory = [];
      json['related_category'].forEach((v) {
        relatedCategory?.add(Related_category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = success;
    map['login'] = login;
    if (relatedCategory != null) {
      map['related_category'] = relatedCategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// category : "Kirana Store"
/// subcategory : "Service Type 3"
/// image : "https://www.digitalraiz.com/projects/divinity/uploads/images/original/97e3ff9aba5cfd8e9b713275c0185a8d.jpg"
/// festival : "birthday"
/// prime_type : "Prime"
/// active : 1

class Related_category {
  String? id;
  String? category;
  String? subcategory;
  String? image;
  String? festival;
  String? primeType;
  bool? active;
  String? type;

  Related_category({
      this.id,
    this.type,
      this.category, 
      this.subcategory, 
      this.image, 
      this.festival, 
      this.primeType, 
      this.active});

  Related_category.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    subcategory = json['subcategory'];
    image = json['image'];
    type=json['type'];
    festival = json['festival'];
    primeType = json['prime_type'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['subcategory'] = subcategory;
    map['image'] = image;
    map['type'] = type;
    map['festival'] = festival;
    map['prime_type'] = primeType;
    map['active'] = active;
    return map;
  }

}