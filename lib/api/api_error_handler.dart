import 'package:get/get.dart';
import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/model/network_model/api_error_model.dart';

class ApiErrorHandler {
  ApiResponse response;

  ApiErrorHandler(this.response) {
    if (response.status! <= 400 && response.status! >= 300) {
      ApiErrorModel model =
          ApiErrorModel.fromJson(this.response.completeResponse);
      Get.snackbar("Exception", model.message!);
    }
    if (response.status! > 499) {
      ApiErrorModel model =
          ApiErrorModel.fromJson(this.response.completeResponse);
      Get.snackbar("Exception", "Please check Internet Connection");
    }
  }
}
