import 'package:socilybrand/api/api.dart';

import '../api_error_handler.dart';

class ApiMethods<T> {
  handleErr(String) {}

  static Future<ApiResponse> post(String location, T) async {
    ApiResponse response = await ApiBase().baseFunction(
        () => ApiBase().getInstance()!.post(location, data: T.toJson()));
    ApiErrorHandler(response);
    return response;
  }
  static Future<ApiResponse> get(String location, T) async {
    ApiResponse response = await ApiBase().baseFunction(
            () => ApiBase().getInstance()!.get(location));
    ApiErrorHandler(response);
    return response;
  }

}
