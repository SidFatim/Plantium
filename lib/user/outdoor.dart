import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import 'description.dart';

class Outdoor  extends StatelessWidget {
  Outdoor({super.key});
  List<String> images = [
    "assets/out1.jpg",
    "assets/out2.jpg",
    "assets/out3.jpg",
    "assets/out4.jpg",
    "assets/out5.avif",

  ];
  List<String> names = [
    "Yuca",
    "Echeveria",
    "Paddle",
    "Green prince",
    "Wax agave",

  ];

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
          title: Center(
              child: Text('Outdoor Plants',
            style: TextStyle(
                color: whitegreen,
                fontWeight: FontWeight.bold,
                fontSize: 25),)),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GridView.builder(shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.OutdoorList.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                          // callNext(context, Description(plantName: value.OutdoorList[index].Ouname,
                          //   price: value.OutdoorList[index].Ouprice,
                          //   description: value.OutdoorList[index].Oudesc,
                          //   image: value.OutdoorList[index].Ouimage,));
                        },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical:5 ),
                            height: 300,
                            width: 200,
                            color: Colors.grey,
                            child:
                            Column(
                              children: [
                                Container(
                                  height: 200,width: width,
                                  child: Image.network(
                                      value.OutdoorList[index].Ouimage,
                                      fit: BoxFit.fill),),
                                Center(child: Text(
                                  value.OutdoorList[index].Ouname,
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
