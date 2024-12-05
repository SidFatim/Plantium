import 'package:flutter/material.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../constant/mywidgets.dart';
import '../user/orderdetail.dart';
import '../user/orderstatus.dart';
import 'orderdetails.dart';

class OrderList extends StatelessWidget {
   OrderList({super.key});

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
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
          back(context);
        },
            child: Icon(
              Icons.chevron_left,
              color: whitegreen,)),
          title: Text("Order list",
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 20,
                color: whitegreen),),
          backgroundColor: darkgreen,),

        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 800,
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
                      itemCount: value.orderList.length,
                      itemBuilder: (context, index) {
                        var item= value.orderList[index];
                        value.getUser(item.userid);
                        return  Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10,vertical: 10),
                          height: 120,width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey
                          ),
                          child: ListTile(
                            minLeadingWidth: 60,
                            minVerticalPadding: 0,
                            horizontalTitleGap: 5,
                            title: Padding(
                              padding: const EdgeInsets.only(top: 30,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: darkgreen),),
                                  Text(value.phone,
                                    style: TextStyle(fontSize: 15),),
                                ],
                              ),
                            ),
                            trailing:  InkWell(
                                onTap: (){
                              callNext(context, TakingOrders(
                                address: item.itemaddress,
                                image: item.itemimage,
                                plantname: item.plantname,
                                quantity: item.itemquantity,
                                name: item.itemname, state: item.itemstate, orderid: item.orderid,));
                            },
                                child: brbtn(height/30,width/5,"Take")),
                          ),);
                      },

                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
