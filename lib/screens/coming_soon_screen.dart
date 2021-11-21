import 'package:flutter/material.dart';
import 'package:netflix_clone/style/style.dart';

class ComingSoonScreen extends StatelessWidget {
   ComingSoonScreen({ Key? key }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<ScrollNotification>(
        
        child: CustomScrollView(
         
          slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            title: Text("Coming Soon",style:StyleForApp.headingBold),
            actions: [
              Icon(Icons.search, color: Colors.white,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.verified_user),)
            ],
          ),
      
        ],
        
        ),
       
      ),
    );
  }
}