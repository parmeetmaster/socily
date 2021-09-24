import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/constants/image_locations.dart';
import 'package:socilybrand/presentation/widgets/container/app_icon.dart';
import 'package:socilybrand/utils/utils.dart';

class FAppBar {
  static getDashBoardAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,

      toolbarHeight: 105.h, // Set this height
      flexibleSpace: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    width: 150.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "\t\t\t\t\t\t\t  \t Buy Premium",
                                    style: TextStyle(
                                        color: AppColors.kWhite,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  margin: EdgeInsets.only(left: 5, top: 25.w),
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.appskyBlue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                    child: Image.asset(
                                  ImageLocations.crown,
                                  height: 30.h,
                                )),
                                Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                            "https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg",
                                          ))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0.h),
                    child: Image.asset(
                      ImageLocations.logotransparent,
                      height: 95.h,
                      width: 130.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              AppIcon(
                                icon: Icons.search,
                                shownum: false,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              AppIcon(
                                icon: Icons.notifications,
                                shownum: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
