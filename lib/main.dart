import 'package:cart_app/mixins/routes/routes.dart';
import 'package:cart_app/ui/auth/auth_binding.dart';
import 'package:cart_app/ui/auth/auth_screen.dart';
import 'package:cart_app/ui/cart/cart_binding.dart';
import 'package:cart_app/ui/cart/cart_screen.dart';
import 'package:cart_app/ui/list_product/product_binding.dart';
import 'package:cart_app/ui/list_product/product_screen.dart';
import 'package:cart_app/ui/splash/splash_binding.dart';
import 'package:cart_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: splashRoute,
      getPages: routePage
    );
  }
}

