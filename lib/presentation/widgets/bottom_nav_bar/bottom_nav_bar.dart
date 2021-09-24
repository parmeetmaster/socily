import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/constants/image_locations.dart';
import 'package:socilybrand/utils/utils.dart';

class FBottomBar extends StatefulWidget {
  Function(int)? onchange;

  FBottomBar({Key? key, this.onchange}) : super(key: key);

  @override
  _FBottomBarState createState() => _FBottomBarState();
}

class _FBottomBarState extends State<FBottomBar> {
  int currunt_index = 0;
  Function(int)? onchange;

  _getImage(
      {required int assignIndex,
      required String whiteimg,
      required String orangeimg}) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                currunt_index = assignIndex;
                if (widget.onchange != null) widget.onchange!(currunt_index);
              });
            },
            child: Image.asset(
              assignIndex == currunt_index ? orangeimg : whiteimg,
              height: 36.h,
            )));
  }

  _getExpanded() {
    return Expanded(
      child: SizedBox(),
    );
  }

  _getCenterIcon(
      {required int assignIndex,
      required String whiteimg,
      required String orangeimg}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            currunt_index = assignIndex;
            if (widget.onchange != null) widget.onchange!(currunt_index);
          });
        },
        child: Container(
            child: Container(
              height: 100.h,
              // no change
              margin:
                  EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.h, right: 8.h),
              padding: EdgeInsets.all(10.h),
              child: Image.asset(ImageLocations.down_arrow),
              decoration: BoxDecoration(
                color: AppColors.kBlack,
                shape: BoxShape.circle,
              ),
            ),
            height: 70.h,
            margin: EdgeInsets.only(bottom: 0.h),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.orange)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w),

      //   color: AppColors.red,
      height: 80.h,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Container(
              child: Row(
                children: [
                  _getImage(
                      assignIndex: 0,
                      whiteimg: ImageLocations.home_white,
                      orangeimg: ImageLocations.home_orange),
                  _getImage(
                      assignIndex: 1,
                      whiteimg: ImageLocations.gear_white,
                      orangeimg: ImageLocations.gear_orange),
                  Expanded(
                    child: SizedBox(),
                  ),
                  _getImage(
                      assignIndex: 3,
                      whiteimg: ImageLocations.feed_white,
                      orangeimg: ImageLocations.feed_orange),
                  _getImage(
                      assignIndex: 4,
                      whiteimg: ImageLocations.person_white,
                      orangeimg: ImageLocations.person_orange),
                ],
              ),
              height: 100.h, //no working
              decoration: BoxDecoration(
                  color: AppColors.kBlack,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
            ),
          ),
          Center(
            child: _getCenterIcon(
                assignIndex: 2,
                whiteimg: ImageLocations.gear_white,
                orangeimg: ImageLocations.gear_orange),
          ),
        ],
      ),
    );
  }
}
