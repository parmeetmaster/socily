import 'package:country_code_picker/country_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/api/methods/api_methods.dart';
import 'package:socilybrand/api/routes.dart';
import 'package:socilybrand/model/request/login/login_request.dart';
import 'package:socilybrand/model/request/otp/otp_request.dart';
import 'package:socilybrand/model/response/login/login_response.dart';
import 'package:socilybrand/model/response/otp/otp_response.dart';
import 'package:socilybrand/presentation/screens/auth/otp_screen.dart';
import 'package:socilybrand/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:socilybrand/utils/firebase.dart';
import 'package:socilybrand/utils/laoders.dart';
import 'package:socilybrand/utils/memory_management.dart';
import 'package:socilybrand/utils/utils.dart';

class AuthController extends GetxController with CodeAutoFill {
   String? authToken;

  String? smsHash;
  LoginResponse? loginResponse;

  var phnoController = TextEditingController();
  TextEditingController? otpController;

  String countryprefix = "+91";

  LoginRequest? loginrequest;

  @override
  void codeUpdated() {
    if (otpController != null) {
      otpController!.text = code!;
    }
  }

  @override
  void onInit() {
    listenForCode();
    SmsAutoFill().getAppSignature.then((signature) {
      " Application Sms Signature  ${signature}".printinfo;
      smsHash = signature;
    });
  }

 Future<void> sentOtp() async {
    try {
      if (phnoController.text.isPhone() != true) {
        Get.snackbar("Error", "Phone number should be 10 digits");
        return;
      }

      Loaders.showCustom("Veryfying");
      this.loginrequest = LoginRequest(
            country_code:"${this.countryprefix}",
            mobile: "${phnoController.text}",
            hash: smsHash ?? "");

      ApiResponse response = await ApiMethods.post(
        Routes.login,
        loginrequest!,
      );

      loginResponse = LoginResponse.fromJson(response.completeResponse);

      Loaders.showCustomSuccess("${loginResponse?.message}");

      Future.delayed(Duration(seconds: 2))
          .then((value) => Get.to(OtpScreens()));
    } catch (e, stacktrace) {
      FirebaseUtils.recordError(e, stacktrace);
    }
  }

   Future<void> verifyOtp() async {
    try {
      ApiResponse response = await ApiMethods.post(Routes.otp,
          OtpRequest(userId: loginResponse!.userId, otp: otpController!.text));

      OtpAuthResponse otpResponse =
          OtpAuthResponse.fromJson(response.completeResponse);

      if (otpResponse == null || otpResponse.success == false) {
        "Otp Invalid".showSnackbar(Get.context!);
        return;
      }

      Get.snackbar(otpResponse.message ?? "Message Performed", "");
      MemoryManagement.setAccessToken(accessToken: otpResponse.data!.token!);
      authToken=otpResponse.data!.token!;
      Get.offAll(DashBoardScreen());
    } catch (e, s) {
      FirebaseUtils.recordError(e, s);
    }
  }

   Future<void> resentOtp() async {
    try {
      ApiResponse response = await ApiMethods.post(
          Routes.login,
          LoginRequest(
              mobile: "${phnoController.text}",
              hash: smsHash ?? "",country_code:"${this.countryprefix}" ));

      loginResponse = LoginResponse.fromJson(response.completeResponse);

      Loaders.showCustomSuccess("${loginResponse?.message}");
    } catch (e, stack) {
      FirebaseUtils.recordError(e, stack);
    }
  }

   Future<String?>  getAuthToken()async{
      if(this.authToken==null){
        this.authToken= await MemoryManagement.getAccessToken();
      }

      return authToken;

  }

  Future<bool> checkUserAlreadyLoggedIN() async {
    String? token = await MemoryManagement.getAccessToken();
    if (token != null && token.isNotEmpty) {
      authToken = token;
      return true;
    }
    return false;
  }

  void country(CountryCode value) {
    this.countryprefix = value.dialCode!;
  }
}
