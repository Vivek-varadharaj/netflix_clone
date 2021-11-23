import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix_clone/api.dart';
import 'package:netflix_clone/screens/coming_soon_screen.dart';
import 'package:netflix_clone/screens/downloads_screen.dart';
import 'package:netflix_clone/screens/fast_laughs_screen.dart';

import 'package:netflix_clone/screens/home_screen.dart';


void main() async {
  List<dynamic> movies = await Api.getMoviesWithVideos();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: MyApp(movies),
  ));
}

class MyApp extends StatefulWidget {
  List<dynamic> movies;
  MyApp(this.movies);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int _selectedIndex = 0;
  final String apiKey = "070180315e67616c89018d2d663a53eb";

  final String readAccesToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzAxODAzMTVlNjc2MTZjODkwMThkMmQ2NjNhNTNlYiIsInN1YiI6IjYxOTVkNTA3NTI4YjJlMDA0NGQ0ZWU4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wQ9CeKs6Wxvm4fjj8x5skrZDicyDNmQd5omkCtCaLQc";

  @override
  Widget build(BuildContext context) {
     List<Widget> bottomNavScreens = [
      HomeScreen(widget.movies),
     
      ComingSoonScreen(),
      FastLaughsScreen(),
      DownloadsScreen(),
      
    ];
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
         currentIndex: _selectedIndex,
        
         unselectedItemColor: Colors.grey.withOpacity(0.5),
         selectedItemColor: Colors.white,
              
              onTap: _onItemTapped,
        //  backgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      
        items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          
          title: Text("Home",style: TextStyle(color: Colors.white,fontSize: 12),),
          icon: Icon(
            Icons.home,
            // color: Colors.white,
            size: 30,
          ),
        ),

        

         BottomNavigationBarItem(
          
          title: Text("Coming Soon",style: TextStyle(color: Colors.white,fontSize: 12),),
          icon: Icon(
            Icons.video_library,
            // color: Colors.white,
            size: 30,
          ),
        ),

         BottomNavigationBarItem(
           backgroundColor: Colors.transparent,
          
           title: Text("Fast Laughs",style: TextStyle(color: Colors.white,fontSize: 12),),
          icon: Icon(
            Icons.sentiment_very_satisfied,
            // color: Colors.white,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          
          title: Text("Downloads",style: TextStyle(color: Colors.white,fontSize: 12),),
          icon: Icon(
            Icons.file_download,
            // color: Colors.white,
            size: 30,
          ),
        ),

        //  BottomNavigationBarItem(
          
        //    title: Text("Downloads",style: TextStyle(color: Colors.white),),
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.white,
        //   ),
        // ),
      ]),
      backgroundColor: Colors.transparent,
      body: bottomNavScreens.elementAt(_selectedIndex),
    );
  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
