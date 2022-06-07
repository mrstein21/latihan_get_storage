import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/formatter.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/ui/cart/cart_controller.dart';
import 'package:cart_app/ui/cart/widget/row_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartController controller=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorDark,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Your Cart",style: kTextAveHev16.copyWith(
          color: kColorWhite
        ),),
      ),
      body: Container(
          child: Obx(
             (){
                return controller.cart.isEmpty?
                    _buildEmpty()
                    :
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildList()),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Grand Total : "+currency.format(controller.grand_total.value),style: kTextAveHev14.copyWith(
                            color: kColorWhite
                          ),),
                          SizedBox(height: kDefaultPadding/2,),
                          InkWell(
                            onTap: (){
                              controller.onPressProceed();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kColorWhite,
                                  width: 1
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Center(
                                  child: Text("Proceed",style: kTextAveHev16.copyWith(
                                    color: kColorWhite
                                  ),)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
          )
      ),
    );
  }


  Widget _buildEmpty(){
    return Center(
      child: Text("Your Cart is Empty",style: kTextAveHev18.copyWith(color: kColorWhite),)
    );
  }


  Widget _buildList(){
    return ListView.builder(
        itemBuilder: (ctx,index)=>RowCart(airsoft: controller.cart[index],index: index,),
        itemCount: controller.cart.length
    );
  }
}
