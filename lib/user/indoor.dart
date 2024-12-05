import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/homescreen.dart';
import 'package:provider/provider.dart';

import 'description.dart';

class Indoor extends StatelessWidget {
   Indoor({super.key});

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
          child: Text('Indoor Plants',
        style: TextStyle(
            color: whitegreen,
            fontWeight: FontWeight.bold,
            fontSize: 25),)),),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.IndoorList.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    callNext(context, Description(
                      // catid: value.IndoorList[index].Inid,
                      plantName: value.IndoorList[index].Inname,
                      price: value.IndoorList[index].Inprice,
                      description: value.IndoorList[index].Indesc,
                      image: value.IndoorList[index].Inimage,
                      Plid: value.plantsList[index].Plid,
                      userid: value.plantsList[index].catid,
                    ));
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5,vertical:5 ),
                      height: 280,
                      width: 200,
                      color: Colors.grey,
                    child:
                    Column(
                      children: [
                        Container(
                          height: 180,width: width,
                          child: Image.network(
                              value.IndoorList[index].Inimage,
                              fit: BoxFit.fill),),
                        Center(child: Text(
                          value.IndoorList[index].Inname,
                          style: TextStyle(
                              color: darkgreen,
                              fontSize: 20),))
                      ],
                    ),
                  )
                  );
              }
              );
            },
          )
      ),
   )
    );
  }
}
