import 'package:file_support/file_support.dart';
import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/api/methods/api_methods.dart';
import 'package:socilybrand/api/routes.dart';
import 'package:socilybrand/model/request/category_image/category_image_request.dart';
import 'package:socilybrand/model/response/category/category_image_response.dart';
import 'package:socilybrand/utils/utils.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CategoryController extends GetxController {
  String id = "";

  RxList relatedCategory = [].obs;
  Rx<int> selectedindex = 0.obs;
  ChewieController?   chewieController;

  VideoPlayerController? videoPlayerController =
      new VideoPlayerController.network("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" );

  @override
  void onInit() async {
    id = Get.arguments["id"];
    "ID ${id}".printinfo;

    loadCategory();
    changeActiveVideo(0);
  }

  void loadCategory() async {
    ApiResponse response = await ApiMethods.post(
        Routes.single_category, CategoryImageRequest(id: id, lang: ""));
    CategoryImageResponse? categoryImageResponse =
        CategoryImageResponse.fromJson(response.completeResponse);
    relatedCategory.value = categoryImageResponse.relatedCategory!;
    videoPlayerController!.play();
    update();
  }

  void changeActiveImage(int i) {
    selectedindex.value = i;
  }

  void changeActiveVideo(int i) async {
    videoPlayerController = VideoPlayerController.network(
      "http://techslides.com/demos/sample-videos/small.mp4");

    await videoPlayerController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
    chewieController!.play();
    update();
  }
}
