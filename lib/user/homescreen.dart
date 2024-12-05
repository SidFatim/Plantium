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
  String userid;

   HomeScreen({super.key,required this.userid});

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
              SizedBox(height: 10),
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
              Image.asset('assets/plt.png'),
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
                height: 300,
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
                                callNext(context, Description(
                                  // catid: item.catid,
                                  plantName: item.Plname,
                                  price: item.Plprice,
                                  description: item.Pldesc,
                                  image: item.Plimage,
                                  Plid: item.Plid,
                                  userid: userid,));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 300,width: 194,color: Colors.grey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Container(
                                        height: 180,width: 170,
                                        child: Image.network(val.plantsList[index].Plimage,
                                          fit: BoxFit.fill,
                                          scale: 1,)),
                                    Text(val.plantsList[index].Plname,
                                      style: TextStyle(
                                        fontSize: 28
                                          ,
                                        color: darkgreen),),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Rs.",style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black54),),
                                        Text(val.plantsList[index].Plprice,
                                          style: TextStyle(
                                              fontSize: 25,color: Colors.black54,
                                              fontWeight: FontWeight.w900),),
                                      ],
                                    ),
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
