import 'package:flutter/material.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../constant/mywidgets.dart';
import '../user/orderdetail.dart';
import '../user/orderstatus.dart';
import 'orderdetails.dart';

class OrderList extends StatelessWidget {
   OrderList({super.key});

   List<String> names = [
     "Sammy Alexander",
     "Lucy Feraz",
   ];
   List<String> address = [

     "North hills,Southampton",
     "Flat 211,Emerald Apartment",
   ];


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
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
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
                              Text(names[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: darkgreen),),
                              Text(address[index],
                                style: TextStyle(fontSize: 15),),
                            ],
                          ),
                        ),
                        trailing:  InkWell(
                            onTap: (){
                          callNext(context, TakingOrders());
                        },
                            child: InkWell(
                                onTap: (){
                              callNext(context, TakingOrders());
                            },
                                child: brbtn(height/30,width/5,"Take"))),
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
