import 'package:flutter/material.dart';
import 'package:netflix_clone/api.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayingWidget extends StatefulWidget {
  String id;
   VideoPlayingWidget(this.id);

  @override
  _VideoPlayingScreenState createState() => _VideoPlayingScreenState();
}

class _VideoPlayingScreenState extends State<VideoPlayingWidget> {
   YoutubePlayerController? _controller;
   

   void initState() {
    super.initState();
   
   
  }
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
     future: Api.getYoutubeVideo(widget.id),
     builder: (context, snapShot){
        if(snapShot.hasData){
          snapShot.data as List;
            _controller = YoutubePlayerController(
       initialVideoId:"pKKK6-UvKEo"
      
     );
     return YoutubePlayer(controller: _controller!);

        }
        else return Container(child: CircularProgressIndicator(),);
     }
   
   );
  }

   @override
  void dispose() {
    super.dispose();
    _controller?..dispose();
  }

 
}
  