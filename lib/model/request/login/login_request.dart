/// mobile : "9871917515"
/// hash : "#askjdi23"

class LoginRequest {
  String? mobile;
  String? hash;

  String? country_code;

  LoginRequest({required this.mobile, required this.hash, required this. country_code});

  LoginRequest.fromJson(dynamic json) {
    mobile = json['mobile'];
    hash = json['hash'];
    country_code = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['hash'] = hash;
    map['country_code'] = country_code;
    return map;
  }
}
