import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/user/register.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/mywidgets.dart';
import 'package:plantium/user/otpscreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: height,width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img_8.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children:[
              SizedBox(height: 100,),
              Text('Plantium',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "fontreg",
                  fontWeight: FontWeight.bold,
                  color: lightgreen),),
              SizedBox(height: 30,),
              Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: width,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: InputDecoration(
                        hintText: "phone number",
                        hintStyle: TextStyle(
                            color: whitegreen),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: whitegreen,),
                      ),
                      style: TextStyle(
                          color: Colors.white),
                      controller: value.loginphoneController,
                    ),
                  );
                }
              ),
              SizedBox(height: 80,),
             Consumer<LoginProvider>(
               builder: (context,value,child) {
                 return InkWell(
                   onTap: (){
                     value.sendotp(context);
                     },
                     child: mybtn(height/15, width/3, "Login"));
               }
             ),
              SizedBox(height: 10,),
              TextButton(
                  onPressed: (){
                callNext(context, RegesiterPage());
              },
                  child: Text("Sign up",
                    style: TextStyle(
                      color: whitegreen,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),))

            ],
          ),
        ),





        ),
      ),
    );
  }
}

