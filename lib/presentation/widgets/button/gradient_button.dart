import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/utils/utils.dart';

class GradientButton extends StatefulWidget {
  var onclick;

  var text;

  double width;

  double height;

  GradientButton(
      {Key? key, this.onclick, this.text, this.width = 100, this.height = 50})
      : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onclick(),
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        child: Center(
            child: Text(
          widget.text ?? "",
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.kWhite),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(colors: [
              AppColors.skyblue,
              AppColors.orange,
            ])),
      ),
    );
  }
}
