import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:socilybrand/controller/dashboard_controller/dashboard_controller.dart';
import 'package:socilybrand/utils/utils.dart';



enum FSLIDEROPR{DASHBOARD,CUSTOMVIEW}

/// CUSTOM SLIDER CAN FIND CONTROLLER AND SHOW IMAGES AS PER ENUM
class Fslider extends StatefulWidget {
  FSLIDEROPR option;
   Fslider(this.option, {Key? key}) : super(key: key);

  @override
  _FsliderState createState() => _FsliderState();
}

class _FsliderState extends State<Fslider> {
  DashBoardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.h,
        aspectRatio: 16 / 9,
        viewportFraction: 0.97,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        //    onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: controller.homeResponse!.brands!.map((i) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(i.image!,),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        );
      }).toList(),
    );
  }
}
