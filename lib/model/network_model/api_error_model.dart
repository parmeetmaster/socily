/// success : false
/// message : "The otp field must contain only numbers."

class ApiErrorModel {
  bool? success;
  String? message;

  ApiErrorModel({this.success, this.message});

  ApiErrorModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }
}
