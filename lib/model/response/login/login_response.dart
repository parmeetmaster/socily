/// success : true
/// user_id : "10"
/// message : "Otp send successfully"

class LoginResponse {
  bool? success;
  String? userId;
  String? message;

  LoginResponse({this.success, this.userId, this.message});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    userId = json['user_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = success;
    map['user_id'] = userId;
    map['message'] = message;
    return map;
  }
}
