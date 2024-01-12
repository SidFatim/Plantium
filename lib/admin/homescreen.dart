import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantium/admin/plantiumabout.dart';
import 'package:plantium/admin/userslist.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../user/loginpage.dart';
import 'adminabout.dart';
import 'category.dart';
import 'orderlist.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container
      (height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img_8.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 200,),
            Center(child: InkWell(
              onTap: (){
              callNext(context, Category());
            },
              child: Container(
                height: 80,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: lightgreen),
                    color: darkgreen),
              child: Center(child: Row(
                children: [
                  SizedBox(width: 50,),
                  Text('Categories',
                    style: TextStyle(
                      color: whitegreen,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),),
                  SizedBox(width: 30,),
                  Icon(
                    Icons.chevron_right,
                    color: whitegreen,
                    size: 40,),
                ],
              )),),
            )),
            SizedBox(height: 40,),
            Center(child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: (){
                  value.getUser();
                  callNext(context, UsersList());
                },
                  child: Container(
                    height: 80,width: 320,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: lightgreen),
                        color: darkgreen),
                    child: Center(
                        child: Row(
                      children: [
                        SizedBox(width: 60,),
                        Text('Users',
                          style: TextStyle(
                            color: whitegreen,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),),
                        SizedBox(width: 85,),
                        Icon(
                          Icons.chevron_right,
                          color: whitegreen,
                          size: 40,),
                      ],
                    )),),
                );
              }
            )),
            SizedBox(height: 40,),
            Center(child: InkWell(onTap: (){
              callNext(context, OrderList());
            },
              child: Container(height: 80,width: 320,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: lightgreen),
                    color: darkgreen),
                child: Center(
                    child: Row(
                  children: [
                    SizedBox(width: 60,),
                    Text('Orders',
                      style: TextStyle(
                        color: whitegreen,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                    SizedBox(width: 70,),
                    Icon(
                      Icons.chevron_right,
                      color: whitegreen,
                      size: 40,),
                  ],
                )),),

            )),
            SizedBox(height: 40,),
            // Consumer<MainProvider>(
            //   builder: (context,value,child) {
            //     return InkWell(
            //       onTap: (){
            //         value.getAbout();
            //         callNext(context, PlantiumAbout());
            //       },
            //       child: Container(
            //         height: 80,width: 320,
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //                 color: lightgreen),
            //             color: darkgreen),
            //         child: Center(
            //             child: Row(
            //               children: [
            //                 SizedBox(width: 60,),
            //                 Text('About',
            //                   style: TextStyle(
            //                       color: whitegreen,
            //                       fontSize: 30,
            //                       fontWeight: FontWeight.bold),),
            //                 SizedBox(width: 85,),
            //                 Icon(
            //                   Icons.chevron_right,
            //                   color: whitegreen,
            //                   size: 40,),
            //               ],
            //             )),),
            //     );
            //   }
            // ),
            SizedBox(height: 20,),
            TextButton(
                onPressed: (){
                  FirebaseAuth auth =FirebaseAuth.instance;
                  auth.signOut();

                  callNextReplacement(context, LoginPage());
                },
                child: Text("Log out",
                  style: TextStyle(
                      color: whitegreen,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),))

          ]
        ),
      ),
    );
  }
}
