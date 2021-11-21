import 'package:flutter/material.dart';
import 'package:netflix_clone/api.dart';
import 'package:netflix_clone/style/style.dart';

class ListViewWithHeading extends StatelessWidget {
 
  String title;
  String id;
  double height;
  ListViewWithHeading( this.title, this.id, this.height);
  List<dynamic> movies=[];



  @override
  Widget build(BuildContext context) {
    
   
    return FutureBuilder(
      future: Api.getDramayMovies(id),
      builder: (context,AsyncSnapshot<dynamic>snapShot) {
        if(snapShot.hasData){
          List moviesBuild = snapShot.data as List;
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
              Container(
                height: height,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: moviesBuild.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.network(
                                "https://image.tmdb.org/t/p/original/" +
                                    snapShot.data![index]["poster_path"],
                                fit: BoxFit.cover),
                          ),
                        )),
              ),
            ],
          )),
        );
        } else return Container();
        
         
      }
    );
  }
}
