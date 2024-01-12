import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';

import '../constant/mycolos.dart';

class TakingStatus extends StatelessWidget {
  const TakingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool checkboxValue=false;
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order confirmed",
                  style: TextStyle(
                    fontSize: 30,
                      color: whitegreen),),
                Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  value: checkboxValue,
                  side:BorderSide(
                      color: whitegreen,
                      width: 2),
                  onChanged: (bool? value) {

                  },
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order packed",
                  style: TextStyle(
                    fontSize: 30,
                      color: whitegreen),),
                Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  value: checkboxValue,
                  side:BorderSide(
                      color: whitegreen,
                      width: 2),
                  onChanged: (bool? value) {

                  },
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order delivered",
                  style: TextStyle(
                    fontSize: 30,
                      color: whitegreen),),
                Checkbox(
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                  value: checkboxValue,
                  side:BorderSide(
                      color: whitegreen,
                      width: 2),
                  onChanged: (bool? value) {

                  },
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
