import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socilybrand/constants/values.dart';
import 'package:socilybrand/controller/dashboard_controller/dashboard_controller.dart';
import 'package:socilybrand/presentation/widgets/grid_item/image_grid_item.dart';
import 'package:socilybrand/presentation/widgets/container/loading_container.dart';
import 'package:socilybrand/presentation/widgets/divider/gradient_divider.dart';
import 'package:socilybrand/presentation/widgets/slider/Fslider.dart';
import 'package:socilybrand/presentation/widgets/text/heading_text.dart';
import 'package:socilybrand/presentation/widgets/text/side_text.dart';
import 'package:socilybrand/utils/utils.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DashBoardController controller = Get.find();
  final childAspectRatio = Values.DASHBOARD_CHILD_ASPECT_RATIO;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (value) {
      if (controller.homeResponse != null)
        return Container(
          child: ListView(children: [
            SizedBox(
              height: 16.h,
            ),
            Fslider(FSLIDEROPR.DASHBOARD),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        HeadingText(
                          text: "All Categories of Images",
                        ),
                        Spacer(),
                        SideText(sidetext: "View All")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GradientDivider(
                        weight: 130.w,
                        height: 10.h,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                ])),
            Container(
              height: 165.h,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                controller: ScrollController(),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  //physics:BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  children: [
                    if (value.homeResponse != null)
                      ...value.homeResponse!.imgCategory!.map(
                        (e) => ImageGridItem(
                          src: e.image,
                          type: gridType.IMAGE,
                          text: e.festival,
                          onclick: (){
                            controller.onClick(e.cid!);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            //videos
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        HeadingText(
                          text: "All Categories of Videos",
                        ),
                        Spacer(),
                        SideText(sidetext: "View All")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GradientDivider(
                        weight: 130.w,
                        height: 10.h,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                ])),
            Container(
              height: 165.h,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                controller: ScrollController(),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  //physics:BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  children: [
                    if (value.homeResponse != null)
                      ...value.homeResponse!.videoCategory!.map(
                        (e) => ImageGridItem(
                          src: e.thumbImg,
                          type: gridType.IMAGE,
                          text: e.festival,  onclick: (){
                          controller.onClick(e.cid!);
                        },
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //frames
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        HeadingText(
                          text: "All Categories of Frames",
                        ),
                        Spacer(),
                        SideText(sidetext: "View All")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GradientDivider(
                        weight: 130.w,
                        height: 10.h,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                ])),
            Container(
              height: 165.h,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                controller: ScrollController(),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  //physics:BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  children: [
                    if (value.homeResponse != null)
                      ...value.homeResponse!.frameCategory!.map(
                        (e) => ImageGridItem(
                          src: e.image,
                          type: gridType.IMAGE,
                          text: e.festival,  onclick: (){
                          controller.onClick(e.cid!);
                        },
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 100,
            )
          ]),
        );
      else
        return LoadingContainer();
    });
  }
}
