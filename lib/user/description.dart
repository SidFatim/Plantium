import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/constant/mywidgets.dart';
import 'package:plantium/provider/loginprovider.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/saved.dart';
import 'package:provider/provider.dart';

import 'cartpage.dart';

class Description extends StatelessWidget {

  String plantName;
  String price;
  String description;
  String image;
  String Plid;
  String userid;
  Description({super.key,required this.plantName,required this.price,required this.description,required this.image,
  required this.Plid,required this.userid
  });

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img_8.png',),
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
              Container(
                height: 250,width: 450,
                child: Image.network(image,
                  fit: BoxFit.fill,),),
              SizedBox(height: 20,),
              Text(plantName,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color:whitegreen),),
              Row(
                children: [
                  SizedBox(width: 110,),
                  Text("Rs.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 45),),
                  Text(price,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),),
                  SizedBox(width: 15,),
                  Icon(Icons.favorite_border,
                    color: lightgreen,
                    size: 40,),
                ],
              ),
              SizedBox(height: 20,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('plant description:',
                    style: TextStyle(
                        fontSize: 25,
                        color: whitegreen),),
                  Text(description,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey),),
                ],
              ),
              SizedBox(height: 20,),
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                      onTap: (){
                        value.addToCart(context,Plid,userid,plantName,price,image);
                    // callNext(context, CartPage());
                  },
                      child: mybtn(height/15, width/3, "Add to cart"));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
