import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mycolos.dart';

PreferredSizeWidget myappbar(){
  return AppBar(
   backgroundColor: darkgreen,
    leading: Icon(Icons.chevron_left),
  );
}
Widget  mybtn(double height,double width,String txt){
  return  Container(
    height: height,
    width: width,
    color: lightgreen,
    child: Center(child: Text(
      txt,
      style: TextStyle(color: whitegreen,fontSize: 20),)),
  );
}
InputBorder border=OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: lgrey,width: 0.2)
);
Widget  brbtn(double height,double width,String txt){
  return  Container(
    height: height,
    width: width,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: lightgreen,),

    child: Center(child: Text(
      txt,
      style: TextStyle(color: whitegreen,fontSize: 18),)),
  );
}



