import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:socilybrand/controller/auth_controller/auth_controller.dart';
import 'package:socilybrand/utils/firebase.dart';

const String base_url = "https://www.digitalraiz.com/projects/divinity/Api";

abstract class Status {
// [Description("true")]
  static const Success = 200,

// [Description("false")]
      Failed = 400,
      Dead = 500,
      EmptyModel = 202,
      Unauthorized = 401,
      Duplicate = 409,
      VerifyEmail = 5001;
}

class ApiBase {
  static Dio? dio;
  AuthController authController = getx.Get.find();

  Dio? getInstance() {
    if (dio == null) {
      _initialize();
    }

    if (authController.authToken != null) {
      print("TOKEN IS : ${authController.authToken}");
      dio!.options.headers
          .addAll({"Authorization": "Bearer " + authController.authToken!});
    }

    return dio;
  }

  _initialize() {
    dio = new Dio(BaseOptions(
        baseUrl: base_url,
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: "application/x-www-form-urlencoded"))
      ..interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        //   responseHeader : true,
        responseBody: true,
        error: true,
        compact: true,
      ));
  }

  Future<ApiResponse> baseFunction(ResponseCallback callback) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Response resp = await callback();
        return ApiResponse(
            completeResponse: resp.data,
            status: 200,
            result: resp.data['result'],
            message: resp.data['message'] ?? "No Message");
      } else
        return ApiResponse(
            message: "Something went wrong", status: Status.Failed, result: {});
    } on SocketException {
      return ApiResponse(
          message: "Check your internet connection",
          status: Status.Dead,
          result: {});
    } on DioError catch (error, stack) {
      FirebaseUtils.recordError(error, stack);
      print("in dio error");
      print(error);
      print(error.response?.data);
      return ApiResponse(
          message: (error.response?.data ?? {})['message']?.toString() ??
              error.message,
          result: (error.response?.data ?? {})['result'] ?? {},
          status: error.response?.statusCode ?? Status.Failed,
          completeResponse: error.response?.data);
    } catch (error, stack) {
      FirebaseUtils.recordError(error, stack);
      print(error);
      // rethrow;

      return ApiResponse(
        message: "Something went wrong",
        status: Status.Failed,
        result: {},
      );
    }
  }
}

typedef Future<Response> ResponseCallback();

class ApiResponse<T> {
  int? status;
  String? message;
  T? result;
  T? completeResponse;

  ApiResponse({this.status, this.message, this.result, this.completeResponse});
}
