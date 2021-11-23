import 'package:flutter/material.dart';
import 'package:netflix_clone/api.dart';
import 'package:netflix_clone/widgets/fast_laugh_widget.dart';

class FastLaughsScreen extends StatelessWidget {
  const FastLaughsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body:  FutureBuilder(
        future: Api.getDramayMovies("18"),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List movies = snapShot.data as List;
            return PageView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => FastLaughWidget(movies[index]),
            );
          } else if(snapShot.connectionState==ConnectionState.waiting){
             return Center(
              child: Container(
                height: 40,
                width: 40,
                child: CircularProgressIndicator())
              );

              
          }
          return Container();
           
            
        },
      ),
    );
  }
}
