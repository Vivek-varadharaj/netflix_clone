import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/movies_screen.dart';
import 'package:netflix_clone/screens/tv_shows_screen.dart';
import 'package:netflix_clone/style/style.dart';

class AppBarHomePage {
  
   
  

  @override
 static AppBarForHome ({required ValueNotifier<double> notifierForBottom, required width, titleOne, titleTwo, titleThree, required Key appBarKey}) {
    
  
      return AppBar(
              elevation: 0,
              backgroundColor: notifierForBottom.value<40? Colors.black.withOpacity(notifierForBottom.value/100): Colors.black.withOpacity(0.4),
              bottom: PreferredSize(
                preferredSize: notifierForBottom.value < 60
                    ? Size(width, 50 - notifierForBottom.value)
                    : Size(width, -10),
                child:     ValueListenableBuilder(valueListenable: notifierForBottom, builder: (context,value,child ){ return Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: 2,
                          child: Container(
                            child: GestureDetector(
                              key: appBarKey,
                              onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>TvShowsScreen()) );
                              },
                              child: titleOne != null? Text(
                                titleOne,
                                style: StyleForApp.heading,
                              ): Container(),
                            ),
                          ),
                        ),
                        Hero(
                          tag: 1,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>MoviesScreen()) );
                            },
                            child:titleTwo != null ? Text(
                              titleTwo,
                              style: StyleForApp.heading,
                            ): Container(),
                          ),
                        ),
                        GestureDetector(
                          child: titleThree != null ? IntrinsicWidth(
                            child: Row(
                              children: [
                                Text(
                                  titleThree,
                                  style: StyleForApp.heading,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ):Container(),
                        ),
                      ],
                    ),
                  ),
                );}
              ),
      ));
    }
  }
