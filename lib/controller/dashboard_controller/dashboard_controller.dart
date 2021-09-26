import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:socilybrand/api/api.dart';
import 'package:socilybrand/api/methods/api_methods.dart';
import 'package:socilybrand/api/routes.dart';
import 'package:socilybrand/model/request/login/login_request.dart';
import 'package:socilybrand/model/response/dashboard_response/home_response.dart';
import 'package:socilybrand/presentation/screens/category_wise/categoty_wise_screen.dart';
import 'package:socilybrand/utils/utils.dart';

class DashBoardController extends GetxController {
HomeResponse? homeResponse;

  Rx<int> tabindex = 0.obs;
  @override
  void onInit() {
    loadDashBoard();
  }

  onpageChange(int index) {
    print(index);
    tabindex.value=index;
  }

  void loadDashBoard() async {
    ApiResponse response = await ApiMethods.get(Routes.get_home, {});
    homeResponse = HomeResponse.fromJson(response.completeResponse);
    update();
  }

  onClick(String cid){
    Get.to(CategoryWiseScreen(),arguments: {"id":cid});

  }


}
