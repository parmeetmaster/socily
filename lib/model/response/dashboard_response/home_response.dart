/// brands : [{"id":"6","title":"Holi Sale","image":"https://www.digitalraiz.com/projects/divinity/uploads/slider/479b71d0984a92fd9cead5d0eb4dd75f.jpg"},{"id":"7","title":"Diwali","image":"https://www.digitalraiz.com/projects/divinity/uploads/slider/8506e73457edaefdb3ebb6ad935854a0.jpg"}]
/// img_category : [{"festival":"birthday","cid":"2","category":"Kirana Store","sub_category":"Service Type 3","image":"https://www.digitalraiz.com/projects/divinity/uploads/images/original/97e3ff9aba5cfd8e9b713275c0185a8d.jpg","prime":"Prime"}]
/// video_category : [{"festival":"Diwali","cid":"3","category":"Pharma","sub_category":"Service Type 3","thumb_img":"https://www.digitalraiz.com/projects/divinity/uploads/images/thumb/c261c2d6d6e0a82eeb77a77ef8c35aef.png","video":"https://www.digitalraiz.com/projects/divinity/uploads/images/original/64011.mp4","prime":"Prime"}]
/// frame_category : [{"festival":"birthday","cid":"6","category":"IT","sub_category":"Service Type 3","image":"https://www.digitalraiz.com/projects/divinity/uploads/images/original/9e9a67f4dabe268b795435986d61e4e2.jpg","prime":"Prime"}]
/// success : true

class HomeResponse {
  List<Brands>? brands;
  List<Img_category>? imgCategory;
  List<Video_category>? videoCategory;
  List<Frame_category>? frameCategory;
  bool? success;

  HomeResponse({
      this.brands, 
      this.imgCategory, 
      this.videoCategory, 
      this.frameCategory, 
      this.success});

  HomeResponse.fromJson(dynamic json) {
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        brands?.add(Brands.fromJson(v));
      });
    }
    if (json['img_category'] != null) {
      imgCategory = [];
      json['img_category'].forEach((v) {
        imgCategory?.add(Img_category.fromJson(v));
      });
    }
    if (json['video_category'] != null) {
      videoCategory = [];
      json['video_category'].forEach((v) {
        videoCategory?.add(Video_category.fromJson(v));
      });
    }
    if (json['frame_category'] != null) {
      frameCategory = [];
      json['frame_category'].forEach((v) {
        frameCategory?.add(Frame_category.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (brands != null) {
      map['brands'] = brands?.map((v) => v.toJson()).toList();
    }
    if (imgCategory != null) {
      map['img_category'] = imgCategory?.map((v) => v.toJson()).toList();
    }
    if (videoCategory != null) {
      map['video_category'] = videoCategory?.map((v) => v.toJson()).toList();
    }
    if (frameCategory != null) {
      map['frame_category'] = frameCategory?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }

}

/// festival : "birthday"
/// cid : "6"
/// category : "IT"
/// sub_category : "Service Type 3"
/// image : "https://www.digitalraiz.com/projects/divinity/uploads/images/original/9e9a67f4dabe268b795435986d61e4e2.jpg"
/// prime : "Prime"

class Frame_category {
  String? festival;
  String? cid;
  String? category;
  String? subCategory;
  String? image;
  String? prime;

  Frame_category({
      this.festival, 
      this.cid, 
      this.category, 
      this.subCategory, 
      this.image, 
      this.prime});

  Frame_category.fromJson(dynamic json) {
    festival = json['festival'];
    cid = json['cid'];
    category = json['category'];
    subCategory = json['sub_category'];
    image = json['image'];
    prime = json['prime'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['festival'] = festival;
    map['cid'] = cid;
    map['category'] = category;
    map['sub_category'] = subCategory;
    map['image'] = image;
    map['prime'] = prime;
    return map;
  }

}

/// festival : "Diwali"
/// cid : "3"
/// category : "Pharma"
/// sub_category : "Service Type 3"
/// thumb_img : "https://www.digitalraiz.com/projects/divinity/uploads/images/thumb/c261c2d6d6e0a82eeb77a77ef8c35aef.png"
/// video : "https://www.digitalraiz.com/projects/divinity/uploads/images/original/64011.mp4"
/// prime : "Prime"

class Video_category {
  String? festival;
  String? cid;
  String? category;
  String? subCategory;
  String? thumbImg;
  String? video;
  String? prime;

  Video_category({
      this.festival, 
      this.cid, 
      this.category, 
      this.subCategory, 
      this.thumbImg, 
      this.video, 
      this.prime});

  Video_category.fromJson(dynamic json) {
    festival = json['festival'];
    cid = json['cid'];
    category = json['category'];
    subCategory = json['sub_category'];
    thumbImg = json['thumb_img'];
    video = json['video'];
    prime = json['prime'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['festival'] = festival;
    map['cid'] = cid;
    map['category'] = category;
    map['sub_category'] = subCategory;
    map['thumb_img'] = thumbImg;
    map['video'] = video;
    map['prime'] = prime;
    return map;
  }

}

/// festival : "birthday"
/// cid : "2"
/// category : "Kirana Store"
/// sub_category : "Service Type 3"
/// image : "https://www.digitalraiz.com/projects/divinity/uploads/images/original/97e3ff9aba5cfd8e9b713275c0185a8d.jpg"
/// prime : "Prime"

class Img_category {
  String? festival;
  String? cid;
  String? category;
  String? subCategory;
  String? image;
  String? prime;

  Img_category({
      this.festival, 
      this.cid, 
      this.category, 
      this.subCategory, 
      this.image, 
      this.prime});

  Img_category.fromJson(dynamic json) {
    festival = json['festival'];
    cid = json['cid'];
    category = json['category'];
    subCategory = json['sub_category'];
    image = json['image'];
    prime = json['prime'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['festival'] = festival;
    map['cid'] = cid;
    map['category'] = category;
    map['sub_category'] = subCategory;
    map['image'] = image;
    map['prime'] = prime;
    return map;
  }

}

/// id : "6"
/// title : "Holi Sale"
/// image : "https://www.digitalraiz.com/projects/divinity/uploads/slider/479b71d0984a92fd9cead5d0eb4dd75f.jpg"

class Brands {
  String? id;
  String? title;
  String? image;

  Brands({
      this.id, 
      this.title, 
      this.image});

  Brands.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    return map;
  }

}