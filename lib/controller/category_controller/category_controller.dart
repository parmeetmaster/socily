import 'package:file_support/file_support.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/api/methods/api_methods.dart';
import 'package:socilybrand/api/routes.dart';
import 'package:socilybrand/model/request/category_image/category_image_request.dart';
import 'package:socilybrand/model/response/category/category_image_response.dart';
import 'package:socilybrand/utils/utils.dart';


class CategoryController extends GetxController {
  String id = "";

  RxList relatedCategory = [].obs;
  Rx<int> selectedindex = 0.obs;
  late VlcPlayerController videoPlayerController;
 // Rx<VlcAdvancedOptions> value=VlcAdvancedOptions().obs;




  @override
  void onInit() async {


    loadCategory();
  }


  @override
  void dispose() {
    if(videoPlayerController!=null){
      videoPlayerController.dispose();
    }
  }

  void loadCategory() async {
    id = Get.arguments["id"];
    "ID ${id}".printinfo;
    ApiResponse response = await ApiMethods.post(
        Routes.single_category, CategoryImageRequest(id: id, lang: ""));
    CategoryImageResponse? categoryImageResponse =
        CategoryImageResponse.fromJson(response.completeResponse);
    relatedCategory.value = categoryImageResponse.relatedCategory!;

    update();
  }

  void changeActiveImage(int i) {
    selectedindex.value = i;
  }

  void changeActiveVideo(int i) async {
    String? videoUrl=(relatedCategory.value[i] as Related_category).video;
    videoPlayerController = VlcPlayerController.network(
      videoUrl!,
      hwAcc: HwAcc.FULL,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    update();
  }
}
