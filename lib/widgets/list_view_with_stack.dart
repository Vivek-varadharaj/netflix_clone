import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/style/style.dart';

class ListViewWithStack extends StatelessWidget {
  String title;
  List<dynamic> movies;
   ListViewWithStack(this.title, this.movies);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
            padding: EdgeInsets.only(left: 8, top: 20, bottom: 10),
            child: Text(
              title,
              style: StyleForApp.headingBold,
            ),
          ),
          Container(padding: EdgeInsets.only(left: 0),
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context,index){
                    return SizedBox(
                      width: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 5),

                      
                      color: Colors.transparent,
                      clipBehavior: Clip.none,
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: [
                            Container(
                              color: Colors.transparent,
                              
                              alignment: Alignment.bottomRight,
                              
                              width: 140,
                              child: Image.network("https://image.tmdb.org/t/p/original/" +
                          movies[index]["poster_path"],
                          errorBuilder: (context,error,stackTrace)=>Container(),
                          ),
                          
                            ),
                            Positioned(
                              left: index !=0 ? -10 :-5,
                              bottom: -20,
                              child: Container(
                               
                                
                                child: BorderedText(
                                  strokeColor: Colors.white,
                                  strokeWidth: 2,
                                  child: Text((index+1).toString(), style: StyleForApp.hollow,)),
                              ),),

                            index !=0 ?  Container(
                                width: 20,
                                height: 170,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [Colors.transparent,
                                    Colors.black])
                                ),
                              ): Container() 
                        
                              
                          ],
                        ),
                      ),

                      
                    );
                  }
                ),
              )
          ],
        ),
      ),
    );
  }
}