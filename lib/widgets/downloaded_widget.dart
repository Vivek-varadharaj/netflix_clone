import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';

class DownloadsWidget extends StatelessWidget {
dynamic movie;
   DownloadsWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:6.0),
        child: Row(
          children: [
            Column(
              children: [
                
              Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: Image.network(
                      "https://image.tmdb.org/t/p/original/" +
                          movie["backdrop_path"],
                          errorBuilder: (context, error, stackTrace)=>Container(),
                    ),
              )
              ],
    
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie["title"],maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("18+ | 5 Episodes | 4.8 GB",style: StyleForApp.smallShade,),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Icon(FontAwesomeIcons.chevronRight,size: 16,color: Colors.grey,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}