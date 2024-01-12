import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';

import '../constant/mycolos.dart';
import '../constant/mywidgets.dart';

class PlantsDescription extends StatelessWidget {
  const PlantsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage
            (image: AssetImage(
              "assets/img_8.png"),
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
          title: Text("Plant description",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: whitegreen),),
          backgroundColor: darkgreen,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,width: 450,
                  child: Image.asset("assets/img_6.png",
                    fit: BoxFit.fill,),),
                SizedBox(height: 30,),
                Text('Name:',
                  style: TextStyle(
                    color: whitegreen,
                    fontSize: 20),),
                Container(
                  height: 40,width: 350,
                  color: Colors.grey,
                  child: TextField(),),
                SizedBox(height: 15,),
                Text('Price:',
                  style: TextStyle(
                    color: whitegreen,
                    fontSize: 20),),
                Container(
                  height: 40,width: 350,
                  color: Colors.grey,
                  child: TextField(),),
                SizedBox(height: 15,),
                Text('Description:',
                  style: TextStyle(
                    color: whitegreen,
                      fontSize: 20),),
                Container(width: 350,
                  color: Colors.grey,
                  child: TextField(
                    maxLines: 10,      ),),
                SizedBox(height: 30,),
                Center(
                    child: mybtn(height/15, width/3, "Remove")),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
