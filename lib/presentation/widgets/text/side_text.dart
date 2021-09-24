

import 'package:flutter/material.dart';
import 'package:socilybrand/utils/utils.dart';
class SideText extends StatelessWidget {
  String sidetext;

   SideText({Key? key,required this.sidetext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(sidetext,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.sp),);
  }
}
