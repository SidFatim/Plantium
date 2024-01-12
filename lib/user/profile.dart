import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/loginpage.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import 'editprofile.dart';
import 'myorders.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          title: Center(
              child: Text('My profile',
            style: TextStyle(
                color: whitegreen,
                fontSize: 25,
                fontWeight: FontWeight.bold),)),
          backgroundColor: darkgreen,),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 130,),
                backgroundColor: darkgreen,
                radius: 80,),),
            Text('Sammy Alexander'
              ,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey),),
            Text('+91 8542936501',style: TextStyle(
                color: whitegreen),),
            SizedBox(height: 25,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: (){
                  // value.getEditUser();
                  callNext(context, EditProfile());
                },
                  child: Container(
                    height: 50,width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: lightgreen),
                        color: darkgreen),
                  child: Row(
                    children: [
                      SizedBox(width: 50,),
                      Text('Edit profile',
                        style: TextStyle(
                            fontSize: 25,
                            color: whitegreen),),
                      SizedBox(width: 70,),
                      Icon(Icons.border_color,color: whitegreen,size: 30)
                    ],
                  ),),
                );
              }
            ),
            SizedBox(height: 15,),
            InkWell(onTap: (){
              callNext(context, MyOrders());
            },
              child: Container(
                height: 50,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: lightgreen),
                    color: darkgreen),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Text('My orders',style: TextStyle(
                        fontSize: 25,color: whitegreen),),
                    SizedBox(width: 75,),
                    Icon(Icons.shopping_bag,color: whitegreen,size: 30)
                  ],
                ),),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                callNext(context, About());
              },
              child: Container(height: 50,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: lightgreen),
                    color: darkgreen),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Text('About us',style: TextStyle(
                        fontSize: 25,
                        color: whitegreen),),
                    SizedBox(width: 90,),
                    Icon(Icons.info_outline_rounded,color: whitegreen,size: 30)
                  ],
                ),),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.grey,
                    content: Text(
                      "Log Out?",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PoetsenOne',
                        color: Color(0xff35103B),
                      ),
                    ),
                    actions: <Widget>[
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                            // height: height/5,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(10),
                                color: Colors.black26),
                          ),
                          Text(
                            "Are you sure want to logout?",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'PoetsenOne',
                              color: Color(0xff35103B),
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    FirebaseAuth auth =FirebaseAuth.instance;
                                    auth.signOut();
                                    callNextReplacement(context, LoginPage());
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'PoetsenOne',
                                      color: Colors.red,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {

                                  },
                                  child: Text(
                                    "No",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'PoetsenOne',
                                      color: Color(0xff35103B),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 50,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(color: lightgreen),
                    color: darkgreen),
                child: Row(
                  children: [
                    SizedBox(width: 50,),
                    Text('Log out',style: TextStyle(
                        fontSize: 25,
                        color: whitegreen),),
                    SizedBox(width: 105,),
                    Icon(Icons.logout,
                        color: whitegreen,
                        size: 30),

                  ],
                ),),
            ),

          ],
        ),
      ),
    );
  }
}
