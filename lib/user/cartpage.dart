import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:provider/provider.dart';

import '../provider/mainprovider.dart';
import 'orderdetail.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img_8.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Center(
            child: Text('Cart',
              style: TextStyle(
                  color: whitegreen,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),)),
        backgroundColor: darkgreen,),
      body: Consumer<MainProvider>(
            builder: (context,value,child) {
              print("cfhcgghh"+value.cartList.length.toString());
              return ListView.builder(
                shrinkWrap: true,
                itemCount: value.cartList.length,
                itemBuilder: (context, index) {
                  var item= value.cartList[index];
                  return  Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10),
                  height: 120,width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10,bottom: 10,top: 10),
                    child: Container(
                      height: 55,width: 60,
                      child: Row(
                        children: [
                          Image.network(item.Crtimg,
                            fit: BoxFit.cover,),
                          Column(
                            children: [
                              Text(item.Crtname,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: darkgreen),),
                              SizedBox(width: 30,),
                              Row(
                                children: [
                                  Text("Rs.",style: TextStyle(fontSize: 20),),
                                  Text(item.Crtprice,
                                    style: TextStyle(
                                        fontSize: 20,),),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  InkWell(
                                      onTap: (){
                                    callNext(context, OrderDetails(image: item.Crtimg,name: item.Crtname,price: item.Crtprice,));
                                  },
                                      child: brbtn(height/30,width/4,"Buy now")),
                                  SizedBox(width: 15,),
                                  Consumer<MainProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(onTap: (){
                                        value.deletecartItem(context, value.cartList[index].Crtid);
                                        // finish(context);
                                        },
                                          child: brbtn(height/30,width/4,"Remove"));
                                    }
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),),
                  ),);
                  },
              );
            }
          ),
      ),
    );
  }
}
