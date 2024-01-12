import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../constant/mywidgets.dart';

class adminAbout extends StatelessWidget {
  const adminAbout({super.key});

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
        backgroundColor:  Colors.transparent,
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                back(context);
              },
              child: Icon(Icons.chevron_left,color: whitegreen,)),
          backgroundColor: darkgreen,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 500,width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black),
                      color: Colors.grey),
                  child: TextField(maxLines: 20,),),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,width: 350,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black),
                    color: Colors.grey),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(Icons.phone,),
                  ),
                ),),
              SizedBox(height: 20,),
              Container(
                height: 50,width: 350,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black),
                    color: Colors.grey),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email,),
                  ),
                ),),
              SizedBox(height: 30,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      // value.addAbout();
                      back(context);
                    },
                      child: mybtn(height/15, width/3, "Save"));
                }
              ),
            ],
          ),
        ),

      ),
    );

  }
}
