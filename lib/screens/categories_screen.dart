import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  List<String> categories = [
    "My List",
    "Available for Download",
    "Holidays",
    "Hindi",
    "Tamil",
    "Punjabi",
    "Malayalam",
    "English",
    "Bengali",
    "Spanish",
    "Italian",
    "Marathi",
    "Action",
    "Anime",
    "Drama",
    "Holidays",
    "Hindi",
    "Tamil",
    "Punjabi",
    "Malayalam",
    "English",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
           children: [
             SizedBox(height: 80,),
              Text("Home",textAlign: TextAlign.center,style: StyleForApp.headingBold,),
              ...categories.map((e) => Padding(padding: EdgeInsets.only(top: 30),
              child: Text(e,textAlign: TextAlign.center,style: StyleForApp.heading,),
              ),),
              SizedBox(height: 100,)
           ],
          ),
          Container(width: MediaQuery.of(context).size.width,
          height: 40,
          color: Colors.black.withOpacity(0.7),
          ),

          Icon(FontAwesomeIcons.solidTimesCircle,size:50)
        ],
      ),
    );
  }
}
