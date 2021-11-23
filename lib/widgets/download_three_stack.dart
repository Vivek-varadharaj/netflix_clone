import 'package:flutter/material.dart';

class DownloadThreeStack extends StatelessWidget {
  List movies;
   DownloadThreeStack(this.movies);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:movies.length!=0 ?  Container(
        margin:EdgeInsets.only(top:30),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          
          children:[
            
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: 260,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Color(0xff333333),
                 ),
               ),
                  Positioned(
                    bottom: 20,
                    right: 60,
                    child: Transform.rotate(
                      angle: 0.4,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/" +
                            movies[0]["poster_path"],
                            width: 120,
                            errorBuilder: (context, error, stackTrace)=>Container(),
                      ),
                    ),
                  ),

                    Positioned(
                      bottom: 20,
                      left: 60,
                      child: Transform.rotate(
                      angle: -0.5,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/" +
                            movies[1]["poster_path"],
                            width: 120,
                            errorBuilder: (context, error, stackTrace)=>Container(),
                      ),
                                      ),
                    ),

                     Image.network(
                    "https://image.tmdb.org/t/p/original/" +
                        movies[2]["poster_path"],
                        width: 140,
                        errorBuilder: (context, error, stackTrace)=>Container(),
                  ),
          ],
        ),
      ):Container()
    );
  }
}