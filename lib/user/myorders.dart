import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';

import 'orderstatus.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});
  List<String> images = [
    "assets/ot3.jpg",
    "assets/img_6.png",

  ];
  List<String> names = [
    "Coral bells",
    "Zanzibar gem",
  ];
  List<String> quantity = [

    "2",
    "1",
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
          backgroundColor: darkgreen,
        title: Center(
            child: Text('My orders',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: whitegreen),)),),
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
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      height: 120,width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                      child: ListTile(
                        minLeadingWidth: 60,
                        minVerticalPadding: 0,
                        leading: SizedBox(
                            height: 100,width: 80,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.fill,)),
                        horizontalTitleGap: 5,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 30,),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(names[index],
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: darkgreen),),
                                Text(quantity[index],
                                  style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        trailing:  InkWell(
                            onTap: (){
                          callNext(context, OrderStatus());
                        },
                            child: brbtn(height/30,width/5,"Track")),
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
