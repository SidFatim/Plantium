import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:provider/provider.dart';

import '../provider/mainprovider.dart';
import 'orderdetail.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  List<String> images = [
    "assets/ot1.jpg",
    "assets/ot2.jpg",
    "assets/ot3.jpg",
    "assets/img_6.png",

  ];
  List<String> names = [
  "Caladium",
  "Agave",
  "Coral bells",
  "Zanzibar gem",
  ];
  List<String> prices = [
    "Rs.650",
    "Rs.750",
    "Rs.900",
    "Rs.999",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img_8.png'),
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
        backgroundColor: darkgreen,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 800,
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                return  Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10,vertical: 10),
                  height: 120,width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10,bottom: 10,top: 10),
                    child: Container(
                      height: 60,width: 80,
                      child: Row(
                        children: [
                          Image.asset(images[index],
                            fit: BoxFit.fill,),
                          Column(
                            children: [
                              Text(names[index],
                                style: TextStyle(
                                  fontSize: 25,
                                  color: darkgreen),),
                              SizedBox(width: 30,),
                              Text(prices[index],
                                style: TextStyle(
                                  fontSize: 20),),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  InkWell(
                                      onTap: (){
                                    callNext(context, OrderDetails());
                                  },
                                      child: brbtn(height/30,width/4,"Buy now")),
                                  SizedBox(width: 15,),
                                  Consumer<MainProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(onTap: (){
                                        // value.deletecartItem();
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
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
