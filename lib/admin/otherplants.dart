import 'package:flutter/material.dart';
import 'package:plantium/admin/addother.dart';
import 'package:plantium/admin/plantsdescription.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/myfunction.dart';
import '../constant/mywidgets.dart';
import 'addindoor.dart';

class OtherPlants extends StatelessWidget {
  OtherPlants({super.key});
  List<String> images = [
    "assets/out1.jpg",
    "assets/out2.jpg",
  ];
  List<String> names = [
    "Yuca",
    "Echeveria",

  ];


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    MainProvider mainProvider = Provider.of<MainProvider>(context,listen: false);
    return Container(
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_8.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        floatingActionButton:  FloatingActionButton(
          backgroundColor: lightgreen,
          child: Icon(Icons.add),
          shape:CircleBorder() ,
        onPressed: () {
            mainProvider.clearother();
          callNext(context, AddOther(Othfrom: "New", OthId: "",));

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
          title: Text('Other plants',
            style: TextStyle(
              color: whitegreen,
                fontSize: 20,
                fontWeight: FontWeight.bold),)
          ,backgroundColor: darkgreen,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 40, width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder:border,
                      enabledBorder: border,
                      errorBorder: border,
                      border:border,
                      hintText: "search",
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (item){
                      mainProvider.searchOthers(item);
                    },
                  ),),
              ),
              SizedBox(
                child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return GridView.builder(shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.OtherList.length,
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                            // callNext(context, PlantsDescription());
                          },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5,vertical:5 ),
                              height: 300,
                              width: 200,
                              color: Colors.grey,
                              child:
                              Column(
                                children: [
                                  Consumer<MainProvider>(
                                    builder: (context,value,child) {
                                      return InkWell(
                                        onTap: (){
                                          showDialog(context: context,
                                              builder: (context) => AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)),
                                                backgroundColor: whitegreen,
                                                actions: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),),
                                                      ),
                                                      SizedBox(height: 50,),
                                                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                finish(context);
                                                                value.getEditother(value.OtherList[index].Otid);
                                                                callNext(context, AddOther(
                                                                  Othfrom: "Edit",
                                                                  OthId: value.OtherList[index].Otid,));
                                                              },

                                                              child: Text(
                                                                  "Edit",
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.bold
                                                                  )),),


                                                            TextButton(
                                                              onPressed: () {
                                                                value.getDeleteother(context,
                                                                    value.OtherList[index].Otid);
                                                                finish(context);
                                                              },

                                                              child:  Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.bold
                                                                  )),)
                                                          ]),
                                                    ],)
                                                ],));
                                        },
                                        child: Container(
                                            height: 200,width: width,
                                            child: Image.network(
                                                value.OtherList[index].Otimage,
                                                fit: BoxFit.cover)),
                                      );
                                    }
                                  ),
                                  Center(child: Text(
                                    value.OtherList[index].Otname,
                                    style: TextStyle(
                                        color: darkgreen,
                                        fontSize: 20),))
                                ],
                              ),

                            ),
                          );
                        },

                      );
                    }
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
