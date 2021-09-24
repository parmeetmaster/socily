import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/utils/utils.dart';
import 'package:socilybrand/utils/utils.dart';

enum gridType { IMAGE, VIDEO, FRAMES }

class ImageGridItem extends StatelessWidget {
  gridType type;

  var src;

  String? text;

  ImageGridItem({Key? key, required this.type, this.src, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == gridType.IMAGE)
      return _getThumnailContainer();
    else
      return Container();
  }

  _getThumnailContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 18,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(src), fit: BoxFit.cover),
              color: AppColors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 5.sp,),
        Expanded(
            flex: 3,
            child: Center(
                child: Text(
              "${text?.camelCase1 ?? ""}",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            )))
      ],
    );
  }
}
