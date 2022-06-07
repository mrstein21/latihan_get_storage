import 'package:cart_app/ui/list_product/product_controller.dart';
import 'package:get/get.dart';

class ListProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProductController());
  }

}