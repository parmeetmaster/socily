import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socilybrand/constants/AppColors.dart';
import 'package:socilybrand/utils/utils.dart';
import 'package:socilybrand/utils/utils.dart';

enum gridType { IMAGE, VIDEO, FRAMES }

class ImageGridActiveItem extends StatefulWidget {
  gridType type;

  String? src;

  String? text;
  Function? onclick;

  bool borderactive;

  ImageGridActiveItem({Key? key, required this.type, this.src, required this.text,this.onclick,required this.borderactive})
      : super(key: key);

  @override
  State<ImageGridActiveItem> createState() => _ImageGridActiveItemState();
}

class _ImageGridActiveItemState extends State<ImageGridActiveItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == gridType.IMAGE)
      return _getThumnailContainer();
    else
      return Container();
  }

  _getThumnailContainer() {
    return GestureDetector(
     onTap: (){
       if(widget.onclick!=null)
          widget.onclick!();
     },

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 18,
            child: Container(
              decoration: BoxDecoration(
                border: widget.borderactive==true?Border.all(color: Colors.lightBlueAccent,width: 4.h):null,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(widget.src!), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 5.sp,),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                "${widget.text?.camelCase1 ?? ""}",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )))
        ],
      ),
    );
  }
}
