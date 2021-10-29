import 'package:file_support/file_support.dart';

import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/api/methods/api_methods.dart';
import 'package:socilybrand/api/routes.dart';
import 'package:socilybrand/model/request/category_image/category_image_request.dart';
import 'package:socilybrand/model/response/category/category_image_response.dart';
import 'package:socilybrand/utils/utils.dart';
import 'package:video_player/video_player.dart';

class CategoryController extends GetxController {
  String id = "";

  RxList relatedCategory = [].obs;
  Rx<int> selectedindex = 0.obs;
  RxBool videoLoading=true.obs;

  late VideoPlayerController videoPlayerController;

  // Rx<VlcAdvancedOptions> value=VlcAdvancedOptions().obs;

  void onscreenClose() async {
    videoPlayerController.pause();
    videoLoading.value=true;
    videoPlayerController.dispose();
    relatedCategory.value.clear();
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
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
    videoLoading.value=true;
    try{
      videoPlayerController.dispose();

    }catch(e){}

    selectedindex.value = i;
    String? videoUrl = (relatedCategory.value[i] as Related_category).video;
    videoPlayerController = VideoPlayerController.network(videoUrl!)
      ..initialize().then((_) {
        videoLoading.value=false;
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        videoPlayerController.play();
        update();
      });
  }
}
