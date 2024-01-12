import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/description.dart';
import 'package:plantium/user/others.dart';
import 'package:plantium/user/indoor.dart';
import 'package:plantium/user/outdoor.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  List<String> images = [
    "assets/ot1.jpg",
    "assets/ot3.jpg",
    "assets/img_4.png",
    "assets/out4.jpg",
    "assets/out3.jpg",
    "assets/img_7.png",

  ];
  List<String> names =[
    "Caladium",
    "Coral bells",
    "Ficus",
    "Green prince",
    "Paddle",
    "Ivy",
  ];
List<String> prices = [
  "Rs.650",
  "Rs.750",
  "Rs.900",
  "Rs.550",
  "Rs.1000",
  "Rs.1500",

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text('Explore your favourite plant!',
                    style: TextStyle(
                        fontSize: 20,
                        color: whitegreen),),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 40, width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return TextField(
                        decoration: InputDecoration(
                          focusedBorder:border,
                          enabledBorder: border,
                          errorBorder: border,
                          border:border,
                          hintText: "search",
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (item){
                          value.searchPlants(item);
                        },
                      );
                    }
                  ),),
              ),
              SizedBox(height: 20,),
              Image.asset('assets/Group234.png'),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Container(height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: lightgreen),
                        child: Center(
                            child: Text('All',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: whitegreen),)),);
                    }
                  ),
                    SizedBox(width: 15,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getIndoor();
                        callNext(context, Indoor());
                      },child
                          : Text('Indoor',style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: whitegreen),));
                    }
                  ),
                  SizedBox(width: 15,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getOutdoor();
                        callNext(context, Outdoor());
                      },
                          child: Text('Outdoor',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: whitegreen),));
                    }
                  ),
                  SizedBox(width: 15,),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                          onTap: (){
                            value.getOther();
                        callNext(context, Others());
                      },
                          child: Text('Others',style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: whitegreen),));
                    }
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 330,

                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Expanded(flex: 3,
                      child: ListView.builder(itemCount: value.plantsList.length,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        var item= value.plantsList[index];
                        return Consumer<MainProvider>(
                          builder: (context,val,child) {
                            return InkWell(
                              onTap: (){
                                callNext(Description(plantName: item.Plname, price: item.Plprice, description: item.Pldesc, image: item.Plimage, catid: , itemId: itemId, userId: userId, itemName: itemName, itemPrice: itemPrice, itemImage: itemImage)
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 300,width: 194,color: Colors.grey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Container(
                                        height: 200,width: 170,
                                        child: Image.network(val.plantsList[index].Plimage,
                                          fit: BoxFit.fill,
                                          scale: 1,)),
                                    Text(val.plantsList[index].Plname,
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: darkgreen),),
                                    Text(val.plantsList[index].Plprice,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),),
                                  ],
                                ),

                              ),
                            );
                          }
                        );

                      },),
                    );
                  }
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
