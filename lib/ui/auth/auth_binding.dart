import 'package:cart_app/ui/auth/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    // TODO: implement dependencies
  }

}