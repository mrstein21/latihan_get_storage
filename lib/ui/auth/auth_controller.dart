import 'package:cart_app/mixins/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
   String name="";
   String email="";
   String password="";
   RxBool isObscured=true.obs;
   GlobalKey<FormState>formKey= new GlobalKey<FormState>();


   void obscureEvent(){
     if(isObscured.value==true){
       isObscured(false);
     }else{
       isObscured(true);
     }
   }

   void submit() {
     if (formKey.currentState!.validate()) {
       formKey.currentState!.save();
       Map<String, dynamic>data = {
         "name": name,
         "email": email,
         "password": password
       };
       GetStorage().write("auth", data);
       Get.offAllNamed(productRoute);
     }
   }

}