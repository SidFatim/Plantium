import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/user/loginpage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScreen> {
  void initState() {
    LoginProvider provider = Provider.of<LoginProvider>(context, listen: false);

    FirebaseAuth auth=FirebaseAuth.instance;
var currentUser =auth.currentUser;
Timer( Duration(seconds: 4), () {
  if(currentUser==null){
    callNextReplacement(context, LoginPage());
  }else{
    provider.userAuthorized(currentUser.phoneNumber, context);
  }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff147846),
      body:Center(
          child: Image.asset('assets/iconimg.png',scale: 3,)),
    ) ;
  }
}

