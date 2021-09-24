/// user_id : "9"
/// otp : "123456"

class OtpRequest {
  String? userId;
  String? otp;

  OtpRequest({this.userId, this.otp});

  OtpRequest.fromJson(dynamic json) {
    userId = json['user_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = userId;
    map['otp'] = otp;
    return map;
  }
}
