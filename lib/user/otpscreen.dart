import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/user/homescreen.dart';
import 'package:plantium/user/navigationbar.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _pinPutFocusNode = FocusNode();
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
        body: Column(
          children: [
            SizedBox(height: 250,),
            Consumer<LoginProvider>(
              builder: (context,value,child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PinFieldAutoFill(
                    controller: value.otpController,
                    codeLength: 6,
                    focusNode: _pinPutFocusNode,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    decoration: BoxLooseDecoration(
                      textStyle:  TextStyle(
                          color: whitegreen,
                          fontWeight: FontWeight.bold),
                      radius: Radius.circular(10),
                      strokeColorBuilder: FixedColorBuilder(Colors.white70),
                    ),
                    onCodeChanged: (pin) {
                      // if (pin!.length == 6) {
                      //   PhoneAuthCredential phoneAuthCredential =
                      //   PhoneAuthProvider.credential(
                      //       verificationId: verificationId,
                      //       smsCode: pin);
                      //   signInWithPhoneAuthCredential(
                      //       context, phoneAuthCredential);
                      //   otpController.text = pin;
                      //   print(otpController.text+"ersgver");
                      //   setState(() {
                      //     Code = pin;
                      //   });
                      // }
                      value.verify(context);

                    },

                  ),
                );
              }
            ),
            SizedBox(height: 150,),
            Consumer<LoginProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: (){
                  },
                    child: mybtn(height/15, width/3, "Verify"));
              }
            ),

          ],
        ),
      ),
    );
  }
}
