import 'package:get/instance_manager.dart';
import 'package:rusconsign/Page/homePage/home_page_controller.dart';


class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
