import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantium/constant/mycolos.dart';
import 'package:plantium/provider/mainprovider.dart';
import 'package:plantium/user/cartpage.dart';
import 'package:plantium/user/homescreen.dart';
import 'package:plantium/user/profile.dart';
import 'package:plantium/user/saved.dart';
import 'package:provider/provider.dart';

class Bottom extends StatefulWidget {
  String userid;
  Bottom({super.key,required this.userid});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;

      print(selectedIndex.toString()+"ppkk");
    });

  }
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    //provider.getUser(widget.userid);

    var pages = [
      HomeScreen(userid:widget.userid ),
      CartPage(),
      Saved(),
      Profile(userid: widget.userid),
    ];
    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(
      body: pages[selectedIndex],
      extendBody: true,
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
        // enableFloatingNavBar: true,
        selectedItemColor: whitegreen,
        unselectedItemColor: lightgreen,
        backgroundColor: darkgreen,
        currentIndex: selectedIndex,

        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home,size: 33,),),

          BottomNavigationBarItem(label: "",
            icon: Icon(Icons.shopping_cart,size: 33,),

          ),
          BottomNavigationBarItem(label: "",
            icon: Icon(Icons.favorite_border,size:33),),

          BottomNavigationBarItem(label: "",
            icon: Icon(Icons.person,size: 33,),),
        ],

      ),
    );
  }
}