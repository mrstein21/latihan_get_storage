import 'dart:async';
import 'package:cart_app/mixins/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
  GetStorage storage=GetStorage();

  startSplash(){
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      if (storage.hasData("auth")) {
        Get.offNamed(productRoute);
      } else {
        Get.offNamed(registerRoute);
      }
    });
  }

  @override
  void onReady() {
    startSplash();
    // TODO: implement onReady
    super.onReady();
  }

}