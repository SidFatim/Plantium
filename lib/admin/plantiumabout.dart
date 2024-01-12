import 'package:flutter/material.dart';
import 'package:plantium/admin/adminabout.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../provider/mainprovider.dart';

class PlantiumAbout extends StatelessWidget {
  const PlantiumAbout({super.key});

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
        child: SafeArea(
          child: Scaffold(
            floatingActionButton:  Consumer<MainProvider>(
                builder: (context,value,child) {
                  return FloatingActionButton(
                      backgroundColor: lightgreen,
                      child: Icon(Icons.add),
                      shape:CircleBorder() ,
                      onPressed: () {
                        value.clearindoor();
                        callNext(context, adminAbout(
                          // Infrom: "New",
                          // InId: "",
                        ));}
                  );
                }
            ),
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
              title: Text("About",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whitegreen),),),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                 Center(
                   child: Consumer<MainProvider>(
                     builder: (context,value,child) {
                       return Container(
                         // child: Text(value.aboutList.Abttext),
                         width: width/1.2,
                         height: 500,
                       );
                     }
                   ),
                 ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(width: width/1.2,
                      height: height/14,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(width: width/1.2,
                      height: height/14,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
