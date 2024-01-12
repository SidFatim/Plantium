import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/constant/myfunction.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

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
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(height: 120,
              width: 420,
              color: Colors.grey,
            child: Row(
              children: [
                Image.asset("assets/ot3.jpg",),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Coral bells',
                        style: TextStyle(
                            fontSize: 28,
                            color: darkgreen),),
                      Text('2',style: TextStyle(
                          fontSize: 22),)
                    ],
                  ),
                ),
              ],
            ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 500,width: 420,
              color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.task_alt,
                        color: lightgreen,
                        size: 50,),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order confirmed',
                            style: TextStyle(
                              fontSize: 20,
                              color: whitegreen),),
                          Text("Mon,7th Aug'23",
                            style: TextStyle(
                              color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      children: [
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.task_alt,
                        color: lightgreen,
                        size: 50,),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order packed',
                            style: TextStyle(
                              fontSize: 20,
                                color: whitegreen),),
                          Text("Wed,9th Aug'23",
                            style: TextStyle(
                              color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      children: [
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                        Icon(Icons.circle,color: lightgreen,size: 10,),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle_outlined,
                        color: lightgreen,
                        size: 50,),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order will be delivered on',
                            style: TextStyle(
                              fontSize: 20,
                              color: whitegreen),),
                          Text("Sat,11th Aug'23",
                            style: TextStyle(
                                color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
                ),
          ],
        ),
      ),
    );
  }
}
