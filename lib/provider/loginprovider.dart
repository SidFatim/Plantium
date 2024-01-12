import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/navigationbar.dart';
import 'package:provider/provider.dart';

import '../admin/homescreen.dart';
import '../constant/myfunction.dart';
import '../user/homescreen.dart';
import '../user/otpscreen.dart';

class LoginProvider extends ChangeNotifier{


  FirebaseFirestore db = FirebaseFirestore.instance;

TextEditingController registernameController =TextEditingController();
TextEditingController registerphoneController =TextEditingController();
TextEditingController loginphoneController =TextEditingController();
TextEditingController otpController=TextEditingController();

FirebaseAuth auth=FirebaseAuth.instance;

String VerificationId="";


void sendotp(BuildContext context) async {
  await auth.verifyPhoneNumber(
    phoneNumber: "+91${loginphoneController.text}",
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == "invalid-phone-number") {
        print("provided phone number is invalid");
      }
    },
    codeSent: (String verificationId, int? resendToken) {
      VerificationId = verificationId;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(),
          ));
      log("Verification Id : $verificationId");
      loginphoneController.clear();
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 60),
  );
}

void verify(BuildContext context) async {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: VerificationId, smsCode: otpController.text);
  await auth.signInWithCredential(credential).then((value) {
    final user = value.user;
    if (user != null) {
     userAuthorized(user.phoneNumber, context);
    }
    else {
      if (kDebugMode) {
        print("6546");
      }
    }
  });}
  String loginUserid='';

Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

  String loginUsername='';
  String loginUsertype='';

  String userId='';
  String loginphno="";
  String loginPhoto="";
  String address="";
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);

  try {
    var phone = phoneNumber!;
    print(phoneNumber.toString()+"duudud");
    db.collection("USER").where("PHONE",isEqualTo:phone).get().then((value) {
      if(value.docs.isNotEmpty) {
        print("fiifuif");
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          loginUsername = map['NAME'].toString();
          loginUsertype = map['TYPE'].toString();
          loginphno = map["PHONE"].toString();
          loginUserid = element.id;
          userId = map["USER_ID"].toString();
          notifyListeners();

          String uid = userId;
          print(loginUsertype);
          if (loginUsertype == "ADMIN") {
            print("cb bcb");
            callNextReplacement(context, AdminHomeScreen());
          }

          else {
            print("mxnxn");

            provider.getPlants();
            callNextReplacement(context, Bottom(),);
          }


          print("dkdkdd");
        }
      }


      else {
        const snackBar = SnackBar(
            backgroundColor: Colors.white,
            duration: Duration(milliseconds: 3000),
            content: Text("Sorry , You don't have any access",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    });


  } catch (e) {

  }
}




}