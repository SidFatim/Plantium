import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';

import 'confirmpage.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage('assets/img_8.png'),
              fit: BoxFit.fill) ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
          back(context);
        },
            child: Icon(
              Icons.chevron_left,color: whitegreen,)),
          backgroundColor: darkgreen,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 250,width: 450,
                  child: Image.asset('assets/ot2.jpg',
                    fit: BoxFit.fill,)),
              Text('Agave',
                style: TextStyle(
                  fontSize: 25,
                  color: lightgreen,
                  fontWeight: FontWeight.bold),),
              Text('Rs.750',
                style: TextStyle(
                  fontSize: 20,
                  color: whitegreen),),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 80,
                      child: Text('Name',
                        style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                  Container(
                    height: 30,width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black),
                        color: Colors.grey),
                  child: TextField(),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                      child: Text('Address',
                        style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                  Container(width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black),
                        color: Colors.grey),
                    child: TextField(maxLines: 3,),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 80,
                      child: Text('State',
                        style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                  Container(
                    height: 30,width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black),
                        color: Colors.grey),
                  child: TextField(),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 80,
                      child: Text('District',
                        style: TextStyle(
                            color: whitegreen,
                            fontSize: 20),)),
                  Container(
                    height: 30,width: 280,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black),
                        color: Colors.grey),
                  child: TextField(),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 80,
                      child: Text('Quantity',
                        style: TextStyle(
                            color: whitegreen,
                            fontSize: 20),)),
                  Container(
                    height: 30,width: 280,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black),
                      color: Colors.grey,),
                    child: TextField(),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                callNext(context, ConfirmPage());
              },
                  child: mybtn(height/15, width/3, "Confirm")),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
