import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:socilybrand/presentation/screens/auth/login.dart';

import 'package:socilybrand/presentation/screens/splash/splash_screen.dart';
import 'package:socilybrand/utils/memory_management.dart';
import 'package:socilybrand/utils/utils.dart';

import 'constants/AppColors.dart';
import 'utils/firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.themeColor, // status bar color
  ));
  await MemoryManagement.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  await FirebaseUtils.initialised();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 847),
        builder: () => GetMaterialApp(
              builder: EasyLoading.init(),
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,

              ),
              // home: SplashScreen(title: 'Flutter Demo Home Page'),
              home: SplashScreen(),
            ));
  }
}
