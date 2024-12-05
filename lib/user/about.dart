import 'package:flutter/material.dart';
import 'package:plantium/constant/myfunction.dart';

import '../constant/mycolos.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:  Color(0xff147846),
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            back(context);
          },
            child: Icon(
              Icons.arrow_back,color: whitegreen,)),
        backgroundColor: Color(0xff147846),
      ),
      body: Column(
        children: [
          Center(child: Image.asset("assets/iconimg.png",scale: 3,)),
          SizedBox(height: 20,),
          Center(
            child: Text("At PLANTIUM,we believe in the transformative power of nature."
                " Our passion for plants goes beyond aesthetics,it's a"
                " commitment to enriching lives, one leaf at a time. As avid plant"
                " enthusiasts, we embarked on a journey to create an online"
                " heaven where plant lovers and green enthusiasts can find the"
                " perfect foliage to adorn their spaces. We are passionate about"
                " fostering a love for nature and enhancing the well-being of our"
                " customers through the magic of plants.\n"
                "               Explore our carefully curated collection of plants, each"
                " handpicked for its beauty, resilience, and unique qualities. From"
                " air-purifying wonders to From  air-purifying wonders to"
                " something for every plant lover.We partner with trusted"
                " growers who share our commitment to excellence.Rest assured,each"
                " plant is nurtured with care and undergoes rigorous quality"
                " with checks before it finds its way to your home. Our app is"
                " designed you in mind.Browse,purchase,and track your order"
                " with ease. Our goal is to make your plant-shopping experience"
                " seamless and enjoyable.\n"
                "               Your satisfaction is our priority. If you have any"
                " questions or concerns, our responsive customer support team"
                " is here to assist you.We stand by the quality of our plants"
                " and your shopping experience.",
              style: TextStyle(color: whitegreen),),
          ),
          SizedBox(height: 50,),
          Center(
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.phone,color: whitegreen,),
                SizedBox(width: 10,),
                Text("8113838488",style: TextStyle(color: whitegreen,fontSize: 25),)
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20,),
              Icon(Icons.mail,color: whitegreen,),
              SizedBox(width: 10,),
              Text("plantiumonline@gmail.com",style: TextStyle(color: whitegreen,fontSize: 25),)
            ],
          )
        ],
      ),
    );
  }
}
