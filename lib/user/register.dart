import 'package:flutter/material.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../constant/mywidgets.dart';
import 'loginpage.dart';

class RegesiterPage extends StatelessWidget {
  const RegesiterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_8.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 80,
                    child: Text('Name',
                      style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: 30,width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black),
                          color: Colors.grey),
                      child: TextField(
                        controller: value.registernameController,
                      ),);
                  }
                ),
              ],
            ),
            SizedBox(height: 80,),
            Row(
              children: [
                SizedBox(width: 80,
                    child: Text('Phone',
                      style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: 30,width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black),
                          color: Colors.grey),
                      child: TextField(
                        controller: value.registerphoneController,
                      ),);
                  }
                ),
              ],
            ),
            SizedBox(height: 50,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    value.AddCustomer("","NEW");
                    callNext(context, LoginPage());
                    },
                    child: mybtn(height/15, width/3, "Sign up"));
              }
            ),
            TextButton(onPressed: (){
              callNext(context, LoginPage());
            },
                child: Text("Login",
                  style: TextStyle(
                    color: whitegreen,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white),))
          ],
        ),
      ),
    );
  }
}
