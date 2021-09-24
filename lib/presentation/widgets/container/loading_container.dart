import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(color: AppColors.appskyBlue),
      ),
    );
  }
}
