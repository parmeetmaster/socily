

import 'package:flutter/material.dart';
import 'package:socilybrand/utils/utils.dart';
class HeadingText extends StatelessWidget {
  String text;

   HeadingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold),);
  }
}
