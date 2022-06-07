import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/formatter.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/model/airsoft.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController{
  GetStorage box=GetStorage();
  Map<String,dynamic>userSession=GetStorage().read("auth");
  RxList<Airsoft>cart=<Airsoft>[].obs;
  RxInt grand_total=0.obs;


  void getStorage(){
    if(box.hasData("items_cart")){
        List<dynamic>value=GetStorage().read("items_cart");
         if(value is List){
           print("To Here's");
           cart.clear();
           cart.addAll(value.map((e) => Airsoft.fromMap(Map.from(e)))
               .toList());
           getGrandTotal();
         }

         listenKey();
    }
  }

  void listenKey(){
    box.listenKey("items_cart", (value){
      if(value is List){
        cart.clear();
        cart.addAll(value.map((e) => Airsoft.fromMap(Map.from(e)))
            .toList());
        getGrandTotal();
      }
    });
  }

  @override
  void onReady() {
    getStorage();
    // TODO: implement onReady
    super.onReady();
  }


  void getGrandTotal(){
    grand_total.value=0;
    for(int i=0;i<cart.length;i++){
      grand_total=grand_total+(cart[i].qty*cart[i].price);
    }
  }

  void onPressProceed(){
      Get.defaultDialog(
          title: "Really want to proceed ?",
          // onConfirm: (){

          // },
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kColorBlack)
                ),
                onPressed: (){
                  Get.back();
                },
                child: Text("Cancel",style: kTextAveHev14.copyWith(
                  color: kColorWhite
                ),)
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kColorWhite)
                ),
                onPressed: (){
                  box.write("items_cart", []).then((value){
                    grand_total.value=0;
                    cart.clear();
                    Get.back();
                    Get.snackbar("Message", "Transaction succeed ! ",colorText: kColorWhite,backgroundColor: kColorBlack,snackPosition: SnackPosition.BOTTOM);
                  });
                },
                child: Text("Confirm",style: kTextAveHev14.copyWith(
                  color: kColorBlack
                ),)
            )
          ],
          backgroundColor: kColorDark,
          titleStyle:kTextAveHev16.copyWith(color: kColorWhite),
          content: Padding(
            padding: const EdgeInsets.all(kDefaultPadding/2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (_,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cart[index].name,style: kTextAveHev14.copyWith(color: kColorWhite),maxLines: 1,),
                            SizedBox(height: kDefaultPadding/5,),
                            Text(currency.format(cart[index].price)+" x "+cart[index].qty.toString(),
                              style: kTextAveRom12.copyWith(
                                color: kColorWhite
                              ),)
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text("Grand Total:",style: kTextAveHev14.copyWith(color: kColorWhite),maxLines: 1,),
                SizedBox(height: kDefaultPadding/5,),
                Text(currency.format(grand_total.value),style: kTextAveRom12.copyWith(color: kColorWhite),),
                SizedBox(height: kDefaultPadding/2,),
                Text("Customer Info :",style: kTextAveHev14.copyWith(color: kColorWhite),maxLines: 1,),
                SizedBox(height: kDefaultPadding/5,),
                Text(userSession["name"],style: kTextAveRom12.copyWith(color: kColorWhite),),
                SizedBox(height: kDefaultPadding/5,),
                Text(userSession["email"],style: kTextAveRom12.copyWith(color: kColorWhite),),
              ],
            ),
          )
      );
  }

  void deleteItem(int index)async{
    cart.removeAt(index);
    box.write("items_cart", cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }

  void updateQty(Airsoft airsoft,int index)async{
    cart[index].qty++;
    box.write("items_cart", cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }

  void minusQty(Airsoft airsoft,int index)async{
    if(airsoft.qty==1){
      cart.removeAt(index);
    }else{
      cart[index].qty--;
    }
    box.write("items_cart", cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }
}