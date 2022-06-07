import 'package:cart_app/mixins/constant/constant.dart';
import 'package:cart_app/mixins/formatter.dart';
import 'package:cart_app/mixins/style/color.dart';
import 'package:cart_app/mixins/style/text.dart';
import 'package:cart_app/model/airsoft.dart';
import 'package:cart_app/ui/cart/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCart extends StatelessWidget {
  CartController controller=Get.find<CartController>();
  late Airsoft airsoft;
  late int index;
  RowCart({
    required this.airsoft,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return _buildRowProduct();
  }

  Widget _buildRowProduct() {
    return IntrinsicHeight(
    child: Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
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
                Text(airsoft.name,style:kTextAveHev14.copyWith(color: kColorWhite),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                SizedBox(
                  height:kDefaultPadding/4,
                ),
                Text(airsoft.formatttedPrice,
                    style:kTextAveRom12.copyWith(color: kColorWhite)) ,
                SizedBox(
                  height:kDefaultPadding/4,
                ),
                Text("Total - "+currency.format(airsoft.price*airsoft.qty),
                    style:kTextAveRom12.copyWith(color: kColorWhite)) ,
                SizedBox(
                  height: kDefaultPadding/4,
                ),
                _buildQty()
              ],
            ),
          )
        ],
      ),
    ),
      );
  }


  Widget _buildQty(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=>controller.deleteItem(index),
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
                  color: kColorWhite,
                  fontSize: 12
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
              onTap: ()=>controller.minusQty(airsoft,index),
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
            Text(airsoft.qty.toString(),
                style: kTextAveHev14.copyWith(
                  color: kColorWhite,
                  fontSize: 12
                )),
            SizedBox(width: 7,),
            InkWell(
              onTap: ()=>controller.updateQty(airsoft,index),
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

}
