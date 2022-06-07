import 'package:cart_app/ui/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   late SplashController controller;
  @override
  Widget build(BuildContext context) {
    controller=Get.find<SplashController>();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/evike.png"),
                SizedBox(height: 5,),
                Text("The Ultimate Airsoft Shop",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: 'Poppins'),)
              ]
          ),
        ),
      ),
    );
  }
}
