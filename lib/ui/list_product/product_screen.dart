import 'package:badges/badges.dart';
import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/routes/routes.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/ui/list_product/product_controller.dart';
import 'package:cart_app/ui/list_product/widget/row_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductController controller=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDark,
      appBar: AppBar(
        backgroundColor: kColorBlack,
        actions: [
          Obx((){
                if(controller.cart.isNotEmpty){
                  return InkWell(
                    onTap: (){
                      Get.toNamed(cartRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Badge(
                          child: Icon(Icons.shopping_cart,color: Colors.white,),
                          badgeColor: Colors.red,
                          badgeContent: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(controller.cart.length.toString(),style: kTextAveHev14.copyWith(
                              color: kColorWhite,
                              fontSize: 12
                            ),),
                          )
                      ),
                    ),
                  );
                }else{
                  return Icon(Icons.shopping_cart,color: kColorWhite);
                }
          }),
          SizedBox(width: kDefaultPadding/2,),
          InkWell(
              onTap: (){
                controller.logout();
              },
              child: Icon(Icons.power_settings_new)
          ),
          SizedBox(width: 12,)
        ],
        title: Text("EVIKE.COM",
          style: kTextAveHev16.copyWith(
            color: kColorWhite
          ),
        ),
      ),
      body: _buildList(),
    );
  }


  Widget _buildList(){
    return ListView.builder(
        itemBuilder: (ctx,index)=>RowProduct(airsoft: controller.list[index],),
        itemCount: controller.list.length
    );
  }

}
