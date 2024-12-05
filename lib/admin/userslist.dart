import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

class UsersList extends StatelessWidget {
   UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img_8.png"),
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
          title: Text("Users list",
            style: TextStyle(
              fontSize: 20,
                fontWeight: FontWeight.bold,
                color: whitegreen),),
          backgroundColor: darkgreen,),
        body:
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return ListView.builder(
                    itemCount:value.adminuserList.length ,
                  itemBuilder: (context,index) {

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
                      height: 120,width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: 25,),
                            Text("Name:",
                              style: TextStyle(
                                  fontSize: 22),),
                            Text(value.adminuserList[index].Usname,
                              style: TextStyle(
                                  fontSize: 22),),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 25,),
                            Text("Phone:",
                              style: TextStyle(
                                  fontSize: 22),),
                            Text(value.adminuserList[index].Usphone,
                              style: TextStyle(
                                  fontSize: 22),),
                          ],
                        ),
                      ],
                    ),


                    );
                  }
                );
              }
            )

      ),
    );
  }
}
