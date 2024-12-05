import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import 'confirmpage.dart';

class OrderDetails extends StatelessWidget {
  String image;
  String name;
  String price;
  OrderDetails({super.key,required this.image,required this.name,required this.price});
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    height: 250,width: 450,
                    child: Image.network(image,
                      fit: BoxFit.fill,)),
                Text(name,
                  style: TextStyle(
                    fontSize: 25,
                    color: lightgreen,
                    fontWeight: FontWeight.bold),),
                Text('Rs.$price',
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
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return TextFormField(
                          controller: value.ordernameController,
                          validator: (value) {
                          if(value==null||value.isEmpty){
                            return "*required";
                          }
                        },
                        );
                      }
                    ),),
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
                    Container(
                      height: 150,
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black),
                          color: Colors.grey),
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return TextFormField(
                            controller: value.orderaddressController,
                              maxLines: 6,
                                validator: (value) {
                                  if(value==null||value.isEmpty){
                                  return "*required";
                                }
                          }
                          );
                        }
                      ),),
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
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return TextFormField(
                          controller: value.orderstateController,
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "*required";
                              }
                            }
                        );
                      }
                    ),),
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
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return TextFormField(
                            keyboardType: TextInputType.number,
                            controller: value.orderquantityController,
                              validator: (value) {
                                if(value==null||value.isEmpty){
                                  return "*required";
                                }
                              }
                          );
                        }
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: (){
                      if(_formKey.currentState!.validate()){
                        value.AddOrder(name,image,context);
                        callNext(context, ConfirmPage());
                      }
                      },
                        child: mybtn(height/15, width/3, "Confirm"));
                  }
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
