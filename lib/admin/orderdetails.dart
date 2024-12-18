import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';

import '../constant/mywidgets.dart';
import 'orderstatus.dart';

class TakingOrders extends StatelessWidget {
  String address;
  String name;
  String state;
  String image;
  String plantname;
  String quantity;
  String orderid;
  TakingOrders({super.key,required this.address,required this.image,required this.plantname,required this.quantity,required this.name,required this.state,required this.orderid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_8.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
          back(context);
        },
            child: Icon(
              Icons.chevron_left,
              color: whitegreen,)),
          title: Text("Order Details",
            style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whitegreen),),
          backgroundColor: darkgreen,),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Delivery Details:",
              style: TextStyle(
                fontSize: 20,
                  color: whitegreen),),
            Center(
              child: Container(
                height: 150,width: 380,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(address),
                      Text(state),
                    ],
                  ),
                ),),
            ),
            SizedBox(height: 20,),
            Text("Orders:",
              style: TextStyle(
                  fontSize: 20,
                  color: whitegreen),),
            Container(
              height: 120,width: 420,
              color: Colors.grey,
              child: Row(
                children: [
                  Image.network(image),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(plantname,
                              style: TextStyle(
                                  fontSize: 20,fontWeight: FontWeight.w900,
                                  color: darkgreen),),
                            SizedBox(width: 40,),
                            InkWell(onTap: (){
                              callNext(context, TakingStatus(orderid: orderid,));
                            },
                                child: brbtn(height/26,width/4,"Confirm")),
                          ],
                        ),
                        Text(quantity,style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
