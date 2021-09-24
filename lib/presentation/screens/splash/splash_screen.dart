import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/controller/auth_controller/auth_controller.dart';
import 'package:socilybrand/presentation/screens/auth/login.dart';
import 'package:socilybrand/presentation/screens/dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    checkAuthenticationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightwhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Image.asset("assets/png/logo.jpeg")],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void checkAuthenticationStatus() async {
    if (await authController.checkUserAlreadyLoggedIN() == true) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Get.offAll(DashBoardScreen());
      });
    } else {
      Get.to(LoginScreen());
    }
  }
}
