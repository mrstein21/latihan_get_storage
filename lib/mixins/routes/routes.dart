import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../ui/auth/auth_binding.dart';
import '../../ui/auth/auth_screen.dart';
import '../../ui/cart/cart_binding.dart';
import '../../ui/cart/cart_screen.dart';
import '../../ui/list_product/product_binding.dart';
import '../../ui/list_product/product_screen.dart';
import '../../ui/splash/splash_binding.dart';
import '../../ui/splash/splash_screen.dart';

const registerRoute="/register";
const splashRoute="/splash";
const productRoute="/home";
const cartRoute="/cart";

var routePage=[
  GetPage(
      name: productRoute,
      page: ()=>ProductScreen(),
      binding: ListProductBinding()
  ),
  GetPage(
      name: cartRoute,
      page: ()=>CartScreen(),
      binding: CartBinding()
  ),
  GetPage(
      name: registerRoute,
      page: ()=>AuthScreen(),
      binding: AuthBinding()
  ),
  GetPage(
      name: splashRoute,
      page: ()=>SplashScreen(),
      binding: SplashBinding()
  ),
];