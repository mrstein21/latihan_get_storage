import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/model/airsoft.dart';
import 'package:cart_app/ui/list_product/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowProduct extends StatelessWidget {
  ProductController controller=Get.find<ProductController>();
  late Airsoft airsoft;
  RowProduct({
    required this.airsoft
  });
  @override
  Widget build(BuildContext context) {
    return _buildRowProduct();
  }

  Widget _buildRowProduct() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2,vertical: kDefaultPadding/2),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                  borderRadius:  new BorderRadius.circular(5.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage(airsoft.image)
                  )
              ),
            ),
            SizedBox(
              width: kDefaultPadding/2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(airsoft.name,style:kTextAveHev14.copyWith(
                   color: kColorWhite
                  )),
                  SizedBox(
                    height:kDefaultPadding/4,
                  ),
                  Text(airsoft.formatttedPrice,style:kTextAveRom12.copyWith(
                    color: kColorWhite
                  )) ,
                  SizedBox(
                    height: kDefaultPadding/4,
                  ),
                  Obx((){
                    ///rproses seleksi apakah items ada di dalam cart
                    Airsoft? airsoft_in_cart=controller.cart.firstWhereOrNull((Airsoft cart_item) =>
                    cart_item.id==
                        airsoft.id);
                    if(airsoft_in_cart!=null){
                      return _buildQty(airsoft_in_cart);
                    }else{
                      return _buildAddToCart();
                    }
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildQty(Airsoft airsoft_in_cart){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=>controller.deleteItem(airsoft_in_cart.id),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.delete,color: Colors.white,size: 18,),
                SizedBox(width: 4,),
                Text("Remove",style: kTextAveHev14.copyWith(
                  fontSize: 12,
                  color: kColorWhite
                ),)
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()=>controller.minusQty(airsoft_in_cart),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 1)
                ),
                child: Icon(Icons.remove,color: Colors.white,size: 18,),
              ),
            ),
            SizedBox(width: 7,),
            /// disi qty yang diambil dari object buku book_on_cart
            Text(airsoft_in_cart.qty.toString(),style: kTextAveHev14.copyWith(
              color: kColorWhite
            )),
            SizedBox(width: kDefaultPadding/5,),
            InkWell(
              onTap: ()=>controller.updateQty(airsoft_in_cart),
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 1)
                ),
                child: Icon(Icons.add,color: Colors.white,size: 18,),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildAddToCart(){
    return SizedBox(
      height: 25,
      child: ElevatedButton(
        onPressed: (){
          controller.addToCart(airsoft);
        },
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: kColorWhite,width: 1)),
            backgroundColor: MaterialStateProperty.all(kColorDark),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))
        ),
        child: Text("Add To Cart",style:kTextAveHev14.copyWith(
            fontSize: 12,
            color: kColorWhite
        )),
      ),
    );
  }

}
