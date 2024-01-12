import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';

import '../constant/mycolos.dart';
import '../constant/mywidgets.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_8.png"),
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
          backgroundColor: darkgreen,
          title: Text("Add category",
            style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whitegreen),),),
        body: Column(
          children: [
            SizedBox(height: 100,),
            Text("Category name:",
              style: TextStyle(
                  fontSize: 20,
                  color: whitegreen),),
            Container(
              height: 50,width: 420,
              color: Colors.grey,
              child: TextField(),),
            SizedBox(height: 100,),
            mybtn(height/15, width/3, "Add"),

          ],
        ),

      ),
    );
  }
}
