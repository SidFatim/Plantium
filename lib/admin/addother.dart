import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:provider/provider.dart';

import '../constant/mycolos.dart';
import '../constant/mywidgets.dart';

class AddOther extends StatelessWidget {
  String Othfrom;
  String OthId;
   AddOther({super.key,required this.Othfrom,required this.OthId});

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
        child: Scaffold
          (backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: InkWell(
                  onTap: (){
                back(context);
              },
                  child: Icon(
                    Icons.chevron_left,color: whitegreen,)),
              title: Text("Plants",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whitegreen),),
              backgroundColor: darkgreen,),
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return GestureDetector(
                                onTap: (){
                                  showBottomSheet(context);},
                                child: value.OtherImages!=null?Container(
                                    height: 200,
                                    width: 300,
                                    // color: Colors.grey,
                                    child: Image.file(
                                      value.OtherImages!,
                                      fit: BoxFit.cover,)
                                ):value.otherimages!=''?Container(
                                    height: 200,
                                    width: 300,
                                    // color: Colors.grey,
                                    child: Image.network(value.otherimages,fit: BoxFit.cover,)
                                ):Container(
                                  height: 200,
                                  width: 300,
                                  color: Colors.grey,
                                  child: Icon(Icons.camera_alt_outlined,size: 110,),
                                ));
                          }
                      ),
                      SizedBox(height: 30,),
                      Text('Name:',
                        style: TextStyle(
                            color: whitegreen,
                            fontSize: 20),),
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return Container(
                              height: 40,width: 350,
                              color: Colors.grey,
                              child: TextField(
                                  controller:value.othernameController),);
                          }
                      ),
                      SizedBox(height: 15,),
                      Text('Price:',
                        style: TextStyle(
                            color: whitegreen,
                            fontSize: 20),),
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return Container(
                              height: 40,width: 350,
                              color: Colors.grey,
                              child: TextField(
                                controller: value.otherpriceController,),);
                          }
                      ),
                      SizedBox(height: 15,),
                      Text('Description:',
                        style: TextStyle(
                            color: whitegreen,
                            fontSize: 20),),
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return Container(
                              width: 350,
                              color: Colors.grey,
                              child: TextField(
                                maxLines: 4,
                                controller: value.otherdescriptionController, ),);
                          }
                      ),
                      SizedBox(height: 30,),
                      Center(child: Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return TextButton(
                                onPressed: (){
                              if (Othfrom =="New"){
                                value.addOther("New","");
                              }else{
                                value.addOther("Edit", OthId);
                              }
                              back(context);
                              },

                                child: mybtn(height/15, width/3, "Save"));
                          }
                      ))
                    ],
                  ),
                ))));

  }
}
void showBottomSheet(BuildContext context) {
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getImagecameraOth(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(
                    Icons.photo,
                    color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegalleryOth(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}

