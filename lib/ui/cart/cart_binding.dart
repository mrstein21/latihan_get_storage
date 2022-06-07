import 'package:cart_app/ui/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CartController());
    // TODO: implement dependencies
  }

}