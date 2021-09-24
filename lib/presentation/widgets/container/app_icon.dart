import 'package:flutter/material.dart';
import 'package:socilybrand/utils/utils.dart';

class AppIcon extends StatefulWidget {
  var icon;

  bool shownum;

  var number;

  AppIcon({Key? key, required this.icon, this.shownum = false, this.number = 0})
      : super(key: key);

  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 30.h,
      child: Stack(
        children: [
          Center(
              child: Icon(
            widget.icon,
            size: 32.h,
          )),
          if (widget.shownum != false)
            Positioned.fill(
                child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                    color: Colors.redAccent, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  "${widget.number}",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                )),
              ),
            ))
        ],
      ),
    );
  }
}
