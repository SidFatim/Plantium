import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';

class Saved  extends StatelessWidget {
  Saved ({super.key});
  List<String> images = [
    "assets/ot2.jpg",
    "assets/ot4.jpg",

  ];
  List<String> names = [
    "Agave",
    "Coleus",

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
          backgroundColor: darkgreen,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height/3,
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5,vertical:5 ),
                      height: height/3,
                      width: width/4,

                      color: Colors.grey,
                      child:
                      Column(
                        children: [
                          Container(
                            height: height/4.5,
                          width: width,
                            child: Image.asset(images[index],
                                fit: BoxFit.fill),),
                          Row(
                            children: [
                              SizedBox(width: 25,),
                              Text(names[index],
                                style: TextStyle(
                                    color: darkgreen,
                                    fontSize: 20),),
                              SizedBox(width: 25,),
                              Icon(Icons.favorite,color: darkgreen,),
                            ],
                          )
                        ],
                      ),

                    );
                  },

                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}

