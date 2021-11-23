import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';

class ComingSoonTile extends StatefulWidget {
  dynamic movie;
  ComingSoonTile(this.movie);

  @override
  State<ComingSoonTile> createState() => _ComingSoonTileState();
}

class _ComingSoonTileState extends State<ComingSoonTile> {
  Future<dynamic>? movies;

  @override
  @override
  Widget build(BuildContext context) {
    
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical:18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/original/" +
                      widget.movie["backdrop_path"],
                      errorBuilder: (context, error, stackTrace)=>Container(),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Image.asset("lib/assets/logo_netflix.png", height: 50, width: 40,)),
                Icon(FontAwesomeIcons.playCircle,size: 40,)
              ],
            ),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                 padding: EdgeInsets.symmetric(vertical: 40),
                  width: 150,
                  child: Image.asset("lib/assets/title.png", fit: BoxFit.fitWidth,)),
    
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(FontAwesomeIcons.bell),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("Remind Me",style: StyleForApp.smallShade,),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:40.0),
                        child: Column(
                          children: [
                            Icon(FontAwesomeIcons.infoCircle),
                            Padding(
                               padding: const EdgeInsets.only(top:8.0),
                              child: Text("info",style: StyleForApp.smallShade,),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ],
            ),),
            Text("Coming on 29th November",style: TextStyle(color: Colors.grey),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Text(widget.movie["title"],style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Text(widget.movie["overview"],maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
