import 'package:cart_app/mixins/routes/routes.dart';
import 'package:cart_app/model/airsoft.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  GetStorage box=GetStorage();
  RxList<Airsoft>cart=<Airsoft>[].obs;
  /// variable untuk menampilkan data airsoft
  RxList<Airsoft>list = [
    Airsoft(
        id: 1,
        name: "Airsoft M14 AEG",
        price: 1000000,
        image: "assets/m14.jpg",
        qty: 0
    ),
    Airsoft(
        id: 2,
        name: "Airsoft M1 Garrand GBB",
        price: 2000000,
        image: "assets/m1_garand.jpg",
        qty: 0
    ),
    Airsoft(
        id: 3,
        name: "Airsoft Mosin Nagant Spring",
        price: 2800000,
        image: "assets/mosin_nagant.jpg",
        qty: 0
    ),
    Airsoft(
        id: 4,
        name: "Airsoft AK47 AEG",
        price: 2700000,
        image: "assets/ak47.jpg",
        qty: 0
    ),
    Airsoft(
        id: 5,
        name: "Airsoft M4 AEG",
        price: 3500000,
        qty: 0,
        image: "assets/m4.jpg"
    ),
    Airsoft(
        id: 6,
        qty: 0,
        name: "Airsoft Dragunov GBB",
        price: 6000000,
        image: "assets/dragunov.jpg"
    ),
  ].obs;


   @override
  void onReady() {
     getStorage();
    super.onReady();
  }



 void getStorage(){
    if(box.hasData("items_cart")){
      List<dynamic> value=GetStorage().read("items_cart");
      if(value is List){
        cart.clear();
        cart.addAll(value.map((e) => Airsoft.fromMap(Map.from(e)))
            .toList());
      }
    }
    listenKey();
 }

 void logout(){
     box.erase();
     Get.offAllNamed(splashRoute);
 }

 void listenKey(){
   box.listenKey("items_cart", (value){
      if(value is List){
         cart.clear();
         cart.addAll(value.map((e) => Airsoft.fromMap(Map.from(e)))
             .toList());
      }
   });
 }

  void deleteItem(int id)async{
    cart.removeWhere((Airsoft airsoft_in_cart) => airsoft_in_cart.id==id);
    box.write("items_cart",cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }

  ///row pada variable cart diupdate qtynya
  void updateQty(Airsoft airsoft)async{
    airsoft.qty=airsoft.qty+1;
    cart.removeWhere((Airsoft airsoft_in_cart) => airsoft_in_cart.id==airsoft.id);
    cart.add(airsoft);
    box.write("items_cart",cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }

  void minusQty(Airsoft airsoft)async{
    if(airsoft.qty==1){
      cart.removeWhere((Airsoft airsoft_in_cart) => airsoft_in_cart.id==airsoft.id);
    }else{
      cart.removeWhere((Airsoft airsoft_in_cart) => airsoft_in_cart.id==airsoft.id);
      airsoft.qty=airsoft.qty-1;
      cart.add(airsoft);
    }
    box.write("items_cart",cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }

  void addToCart(Airsoft airsoft)async{
    airsoft.qty=1;
    cart.add(airsoft);
    box.write("items_cart",cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
  }
}