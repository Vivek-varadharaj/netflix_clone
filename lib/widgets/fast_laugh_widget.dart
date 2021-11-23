import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';

class FastLaughWidget extends StatefulWidget {
  dynamic? movie;
  FastLaughWidget(this.movie);

  @override
  State<FastLaughWidget> createState() => _FastLaughWidgetState();
  void getFilms() async {}
}

class _FastLaughWidgetState extends State<FastLaughWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            "https://image.tmdb.org/t/p/original/" +
                widget.movie["poster_path"],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Container(
           
            height: MediaQuery.of(context).size.height * 0.5,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                 backgroundColor: Colors.blue,
                      
                      backgroundImage: NetworkImage(
                      "https://image.tmdb.org/t/p/original/" +
                          widget.movie["backdrop_path"],
                     
                    )
                    ),

                    Column(
                      children: [
                        Icon(FontAwesomeIcons.grinSquint,color: Colors.white,),
                        Text("5.27 k")
                      ],
                    ),

                    Column(
                      children: [
                        Icon(FontAwesomeIcons.plus,color: Colors.white,),
                        Text("My List")
                      ],
                    ),

                    Column(
                      children: [
                        Icon(FontAwesomeIcons.share,color: Colors.white,),
                        Text("share")
                      ],
                    ),

                    Column(
                      children: [
                        Icon(FontAwesomeIcons.play,color: Colors.white,),
                        Text("Play")
                      ],
                    ),
                    
              ],
            ),
          ),
        ),

        Positioned(
          top: 30,
          left: 20,
          child: Text(widget.movie["title"],style: StyleForApp.heading,)),

           Positioned(
          top: 30,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4)
            ),
            padding: EdgeInsets.all(4),
            child: Text("13 +",),)),


      ],
    );
  }
}
