import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import 'orderstatus.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});

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
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return SizedBox(
                    height: 800,
                    child: ListView.builder(
                      itemCount: value.UserOrderList.length,
                      itemBuilder: (context, index) {
                        var item = value.UserOrderList[index];
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
                                child: Image.network(
                                  item.itemimage,
                                  fit: BoxFit.fill,)),
                            horizontalTitleGap: 5,
                              title: Padding(
                                padding: const EdgeInsets.only(top: 40,),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.plantname,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: darkgreen),),
                                  ],
                                ),
                              ),
                            trailing:  Consumer<MainProvider>(
                              builder: (context,val,child) {
                                return InkWell(
                                    onTap: (){
                                  callNext(context, OrderStatus(orderid: '',image: val.UserOrderList[index].itemimage,name: val.UserOrderList[index].plantname,quantity: val.UserOrderList[index].itemquantity,));
                                },
                                    child: brbtn(height/30,width/5,"Track"));
                              }
                            ),
                          ),);
                        },
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
