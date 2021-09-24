import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/constants/image_locations.dart';
import 'package:socilybrand/presentation/widgets/button/gradient_button.dart';
import 'package:socilybrand/utils/utils.dart';
import 'package:socilybrand/controller/auth_controller/auth_controller.dart';

class OtpScreens extends StatefulWidget {
  const OtpScreens({Key? key}) : super(key: key);

  @override
  _OtpScreensState createState() => _OtpScreensState();
}

class _OtpScreensState extends State<OtpScreens> {
  AuthController controller = Get.find();
  TextEditingController otpcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.otpController = otpcontroller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset(ImageLocations.logincurved),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                height: 350.h,
                width: 350.w,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: [
                      Text(
                        "Enter OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28.sp),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        textStyle: TextStyle(
                          color: AppColors.black_heading,
                          fontWeight: FontWeight.bold,
                        ),

                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          activeFillColor: AppColors.offWhite,
                          activeColor: AppColors.offWhite,
                          selectedColor: AppColors.offWhite,
                          selectedFillColor: AppColors.offWhite,
                          inactiveColor: AppColors.offWhite,
                          inactiveFillColor: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 35.h,
                          fieldWidth: 35.h,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: otpcontroller,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GradientButton(
                          onclick: () {
                            "clicked".printinfo;
                            controller.verifyOtp();
                          },
                          text: "Submit",
                          height: 55,
                          width: 200),
                      SizedBox(
                        height: 50.h,
                      ),
                      InkWell(
                          onTap: () {
                            "clicked".printinfo;
                            controller.resentOtp();
                          },
                          child: Text(
                            "Resent Otp",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                ),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3.w, color: AppColors.cyan_grey)),
              ),
            ),
          ])
        ],
      ),
    ));
  }
}
