import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';

class GradientDivider extends StatefulWidget {
  var weight;

  var height;

  GradientDivider({Key? key,required this.height,required this.weight}) : super(key: key);

  @override
  _GradientDividerState createState() => _GradientDividerState();
}

class _GradientDividerState extends State<GradientDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.weight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right: Radius.circular(20)),
          gradient: LinearGradient(colors: [
        AppColors.skyblue, AppColors.orange


      ])),
    );
  }
}
