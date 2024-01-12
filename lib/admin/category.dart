import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:provider/provider.dart';

import '../provider/mainprovider.dart';
import 'addcategory.dart';
import 'indoorplants.dart';
import 'otherplants.dart';
import 'outdoorplants.dart';

class Category extends StatelessWidget {
  const Category({super.key});

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
            backgroundColor: darkgreen,
            title: Text("Categories",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: whitegreen),),),
          body: Column(
            children: [
              SizedBox(height: 100,),
              Center(child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      value.getIndoor();
                    callNext(context, IndoorPlants());
                  },
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return Container(
                          height: 80,width: 320,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: lightgreen),
                              color: darkgreen),
                          child: Center(
                              child: Row(
                            children: [
                              SizedBox(width: 80,),
                              Text('Indoor',
                                style: TextStyle(
                                    color: whitegreen,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: 80,),
                              Icon(
                                Icons.chevron_right,
                                color: whitegreen,
                                size: 40,),
                            ],
                          )),);
                      }
                    ),
                  );
                }
              )),
              SizedBox(height: 40,),
              Center(child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                    value.getOutdoor();
                    callNext(context, OutdoorPlants());
                  },
                    child: Container(
                      height: 80,width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: lightgreen),
                          color: darkgreen),
                      child: Center(child: Row(
                        children: [
                          SizedBox(width: 80,),
                          Text('Outdoor',
                            style: TextStyle(
                                color: whitegreen,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),),
                          SizedBox(width: 60,),
                          Icon(Icons.chevron_right,
                            color: whitegreen,
                            size: 40,),
                        ],
                      )),),
                  );
                }
              )),
              SizedBox(height: 40,),
              Center(child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: (){
                      value.getOther();
                      callNext(context, OtherPlants());
                  },
                    child: Container(
                      height: 80,width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: lightgreen),
                          color: darkgreen),
                      child: Center(
                          child: Row(
                        children: [
                          SizedBox(width: 80,),
                          Text('Others',
                            style: TextStyle(
                              color: whitegreen,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),),
                          SizedBox(width: 80,),
                          Icon(
                            Icons.chevron_right,
                            color: whitegreen,
                            size: 40,),
                        ],
                      )),),
                  );
                }
              )),
              ],
          ),
        )
    );
  }
}

