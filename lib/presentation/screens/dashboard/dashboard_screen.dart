import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/controller/dashboard_controller/dashboard_controller.dart';
import 'package:socilybrand/presentation/widgets/appbar/appbar.dart';
import 'package:socilybrand/presentation/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:socilybrand/presentation/widgets/container/image_grid_item.dart';
import 'package:socilybrand/presentation/widgets/divider/gradient_divider.dart';
import 'package:socilybrand/presentation/widgets/slider/Fslider.dart';
import 'package:socilybrand/presentation/widgets/text/heading_text.dart';
import 'package:socilybrand/presentation/widgets/text/side_text.dart';
import 'package:socilybrand/utils/utils.dart';

import 'home_tab.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: FAppBar.getDashBoardAppBar(),
      body: Obx(()=> controller.tabindex==0? HomeTab():Container()),
      floatingActionButton: FBottomBar(onchange: controller.onpageChange),
    ));
  }
}
