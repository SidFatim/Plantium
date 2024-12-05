import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  String userid;
   EditProfile({super.key,required this.userid});

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
          leading: InkWell(
              onTap: (){
          back(context);
        },
            child: Icon(
              Icons.chevron_left,
              color: whitegreen,)),
        title: Center(
            child: Text('Edit profile',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: whitegreen),)),
        backgroundColor: darkgreen,),
        body: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 80,
                    child: Text('Name:',
                      style: TextStyle(
                        color: whitegreen,
                        fontSize: 20),
                    )),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: 30,width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.grey),
                      child: TextField(
                        controller: value.registernameController,
                      ),);
                  }
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 80,
                    child: Text('Phone:',
                      style: TextStyle(
                          color: whitegreen,
                          fontSize: 20),)),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: 30,width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.grey),
                      child: TextFormField(enabled: false,
                        controller: value.registerphoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      ),);
                  }
                ),
              ],
            ),
            SizedBox(height: 30,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return GestureDetector(onTap: (){
                  value.AddCustomer(userid, "EDIT");
                  back(context);
                },
                    child: mybtn(height/15, width/3, "Update"));
              }
            ),
          ],
        ),
      ),
    );
  }
}
