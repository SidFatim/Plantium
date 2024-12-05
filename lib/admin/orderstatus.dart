import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../provider/mainprovider.dart';

class TakingStatus extends StatelessWidget {
  String orderid;
  TakingStatus({super.key,required this.orderid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img_8.png"),
            fit: BoxFit.fill),),
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
          title: Text("Order Status",
            style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whitegreen),),
          backgroundColor: darkgreen,),
        body: Column(
          children: [
            SizedBox(height: 20,),
        Row(
          children: [
            Text("Order confirmed",style: TextStyle(color: whitegreen,fontSize: 25)),
            SizedBox(width: 150), //SizedBox
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Radio(
                      activeColor:  whitegreen,
                      value: "Order confirmed",
                      groupValue:val.ordervaluew,
                      onChanged: (value){
                        val.ordervaluew = value.toString();
                        val.notifyListeners();
                      }
                  );
                }
            ),
          ],
        ),
        Row(
          children: [
            Text("Order packed",style: TextStyle(color: whitegreen,fontSize: 25)),
            SizedBox(width: 185), //SizedBox
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Radio(
                      activeColor:  whitegreen,
                      value: "Order packed",
                      groupValue:val.ordervaluew,
                      onChanged: (value){
                        val.ordervaluew= value.toString();
                        val.notifyListeners();
                      }
                  );
                }
            ),
          ],
        ),

        Row(
          children: [
            Text("Order delivered",style: TextStyle(color: whitegreen,fontSize: 25)),
            SizedBox(width: 165), //SizedBox
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Radio(
                      activeColor:  whitegreen,
                      value: "Order delivered",
                      groupValue:val.ordervaluew,
                      onChanged: (value){
                        val.ordervaluew = value.toString();
                        val.notifyListeners();
                      }
                  );
                }
            ),
          ],
        ),
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return InkWell(onTap: () {
                    val.updateorder(orderid, context);
                  },
                    child: Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration( color: Color(0xff85723A) ,borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700))),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
