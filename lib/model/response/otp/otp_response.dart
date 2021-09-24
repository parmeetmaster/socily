/// success : true
/// message : "Login successfully"
/// data : {"user_id":"9","name":"","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjkiLCJ0aW1lIjoxNjMyMDUwMDI0LCJraWxsIjoiQTc3NEVTQ1U4NEhYMlhPQjk2T1JDVUQ3SVIzMk9CSUdORUZMSjVTWUlQTllCRERTU00ifQ.DO3xK1eEqU63MozdBSxa5THDkYjJUZWff_Il4_tcYCY"}

class OtpAuthResponse {
  bool? success;
  String? message;
  Data? data;

  OtpAuthResponse({this.success, this.message, this.data});

  OtpAuthResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// user_id : "9"
/// name : ""
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjkiLCJ0aW1lIjoxNjMyMDUwMDI0LCJraWxsIjoiQTc3NEVTQ1U4NEhYMlhPQjk2T1JDVUQ3SVIzMk9CSUdORUZMSjVTWUlQTllCRERTU00ifQ.DO3xK1eEqU63MozdBSxa5THDkYjJUZWff_Il4_tcYCY"

class Data {
  String? userId;
  String? name;
  String? token;

  Data({this.userId, this.name, this.token});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = userId;
    map['name'] = name;
    map['token'] = token;
    return map;
  }
}
