import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/ui/auth/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child:Text("EVIKE.COM",textAlign:TextAlign.center,style: kTextAveHev18.copyWith(
                          fontSize: 40,
                          color: kColorWhite
                        ))
                    ),
                    SizedBox(height:kDefaultPadding*2),
                    TextFormField(
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "please fill your name";
                        }
                        return null;
                      },
                      onSaved: (String? value){
                        controller.name=value!;
                      },
                      style: kTextAveRom14.copyWith(
                        color: kColorWhite
                      ),
                      decoration: InputDecoration(
                        errorStyle:  kTextAveRom12.copyWith(
                            fontSize: 10,
                            color: kColorWhite
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Name",

                      ),
                    ),
                    SizedBox(height:kDefaultPadding),
                    TextFormField(
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "please fill your email";
                        }
                        return null;
                      },
                      onSaved: (String? value){
                        controller.email=value!;
                      },
                      style: kTextAveRom14.copyWith(
                          color: kColorWhite
                      ),
                      decoration: InputDecoration(
                        errorStyle:  kTextAveRom12.copyWith(
                            fontSize: 10,
                            color: kColorWhite
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height:kDefaultPadding),
                    Obx(()=> TextFormField(
                        obscureText: controller.isObscured.value,
                        validator: (String? value){
                          if(value!.isEmpty){
                            return "please fill your password";
                          }
                          return null;
                        },
                        onSaved: (String? value){
                          controller.password=value!;
                        },
                        style: kTextAveRom14.copyWith(
                            color: kColorWhite
                        ),
                        decoration: InputDecoration(
                          errorStyle:  kTextAveRom12.copyWith(
                            fontSize: 10,
                            color: kColorWhite
                           ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon:
                            InkWell(
                              onTap: (){
                                controller.obscureEvent();
                              },
                              child: controller.isObscured==true?
                              Icon(Icons.visibility,color: Colors.white,)
                                  :Icon(Icons.visibility_off,color: Colors.white,),
                            ),

                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding*2,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          controller.submit();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kColorWhite),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                          ))
                        ),
                        child: Text("Register",style:kTextAveHev14.copyWith(
                            color: kColorBlack
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
