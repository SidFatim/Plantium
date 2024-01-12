import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/others.dart';
import 'package:plantium/user/cartpage.dart';
import 'package:plantium/user/confirmpage.dart';
import 'package:plantium/user/description.dart';
import 'package:plantium/user/editprofile.dart';
import 'package:plantium/user/indoor.dart';
import 'package:plantium/user/loginpage.dart';
import 'package:plantium/user/homescreen.dart';
import 'package:plantium/user/myorders.dart';
import 'package:plantium/user/navigationbar.dart';
import 'package:plantium/user/orderdetail.dart';
import 'package:plantium/user/orderstatus.dart';
import 'package:plantium/user/otpscreen.dart';
import 'package:plantium/user/outdoor.dart';
import 'package:plantium/user/profile.dart';
import 'package:plantium/user/register.dart';
import 'package:plantium/user/saved.dart';
import 'package:plantium/user/splashScreen.dart';
import 'package:provider/provider.dart';

import 'admin/addindoor.dart';
import 'admin/category.dart';
import 'admin/homescreen.dart';
import 'admin/indoorplants.dart';
import 'admin/plantsdescription.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> MainProvider()),
      ChangeNotifierProvider(create: (context)=> LoginProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}


