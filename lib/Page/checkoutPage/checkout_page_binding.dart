import 'package:get/get.dart';
import 'package:rusconsign/Page/checkoutPage/checkout_page_controller.dart';

class CheckoutPageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutPageController());
  }
}