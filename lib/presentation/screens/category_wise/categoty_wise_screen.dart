import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:socilybrand/constants/values.dart';
import 'package:socilybrand/controller/category_controller/category_controller.dart';
import 'package:socilybrand/model/response/category/category_image_response.dart';
import 'package:socilybrand/presentation/widgets/appbar/appbar.dart';
import 'package:socilybrand/presentation/widgets/container/loading_container.dart';
import 'package:socilybrand/presentation/widgets/grid_item/image_grid_active_item.dart';
import 'package:socilybrand/utils/extension.dart';
import 'package:video_player/video_player.dart';

class CategoryWiseScreen extends StatefulWidget {
  CategoryWiseScreen({Key? key}) : super(key: key);

  @override
  _CategoryWiseScreenState createState() => _CategoryWiseScreenState();
}

class _CategoryWiseScreenState extends State<CategoryWiseScreen> {
  CategoryController controller = Get.put(CategoryController());

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Related_category selectedcategory = Related_category();

    return SafeArea(child: Obx(() {
      if (controller.relatedCategory.isNotEmpty)
        selectedcategory = (controller.relatedCategory
            .value[controller.selectedindex.value] as Related_category);
      if(selectedcategory.type=="video"){
        controller.changeActiveVideo(controller.selectedindex.value);
      }



      return Scaffold(
          appBar: FAppBar.getAppBarWithLanguage(),
          body: GetBuilder<CategoryController>(builder: (snapshot) {
            return controller.relatedCategory.value.isNotEmpty
                ? Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                       (selectedcategory.type == "image" ||
                          selectedcategory.type == "frame")?
                        Container(
                          height: size.height * 0.4,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: "${(() {
                              return selectedcategory.image;
                            }())}",
                          ),
                        ):
                        Container(
                          height: size.height * 0.4,
                          child: Container(
                            height: size.height * 0.4,
                            child: VideoPlayer(

                                controller.videoPlayerController),
                          ),
                        ),
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: Values.DASHBOARD_CHILD_ASPECT_RATIO,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                        //physics:BouncingScrollPhysics(),
                        padding: EdgeInsets.all(10.0),
                        children: [
                          ...controller.relatedCategory
                              .mapIndexed((e, i) => ImageGridActiveItem(
                                    src: (e as Related_category).image,
                                    text: (e as Related_category).festival,
                                    type: gridType.IMAGE,
                                    onclick: () {
                                      if (e.type == "image" ||
                                          e.type == "frame")
                                        controller.changeActiveImage(i);
                                      else
                                        controller.changeActiveVideo(i);
                                    },
                                    borderactive:
                                        controller.selectedindex.value == i,
                                  ))
                        ],
                      ),
                    ],
                  )
                : LoadingContainer();
          }));
    }));
  }
}
