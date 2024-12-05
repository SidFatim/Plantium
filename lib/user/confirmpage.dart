import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

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
          body: Column(
            children: [
              SizedBox(height: 180,),
              Center(child: Image.asset('assets/confirm.png',scale: 3,)),
              Text('Your order has been\n         confirmed!',
                style: TextStyle(
                    fontSize: 30,
                    color: whitegreen),),
            ],
          ),
        )
    );
  }
}
