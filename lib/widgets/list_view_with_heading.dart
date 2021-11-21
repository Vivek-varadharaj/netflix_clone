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
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder: (context)=>Container(
                          height: MediaQuery.of(context).size.height*0.35,
                          
                          width:  MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xff313131),
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(14),topRight:Radius.circular(14) )
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                    
                                      children: [
                                        Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          height: MediaQuery.of(context).size.height*0.3*0.6,
                                          width: MediaQuery.of(context).size.width*0.25,
                                          child:  Image.network(
                            "https://image.tmdb.org/t/p/original/" +
                                snapShot.data![index]["poster_path"],
                            fit: BoxFit.cover),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container(
                                    // height: MediaQuery.of(context).size.height*0.3*0.6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Column(
                                        
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(snapShot.data![index]["title"],style:StyleForApp.headingBold,maxLines: 1,),
                                            ],
                                            
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Row(
                                              children: [
                                                Text(snapShot.data![index]["release_date"].toString().split("-")[0],style:StyleForApp.smallShade,maxLines: 1,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:20.0),
                                                  child: Text("Rating: " + snapShot.data![index]["vote_average"].toString(),style:StyleForApp.smallShade,maxLines: 1,),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:8.0),
                                            child: Text(snapShot.data![index]["overview"].toString(), maxLines: 4,overflow: TextOverflow.ellipsis,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(8),
                                      width: MediaQuery.of(context).size.width*0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.play_arrow, color: Colors.black,),
                                          Text("Play",style: TextStyle(color: Colors.black),)
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.download),
                                          Text("Download")
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.play_arrow_sharp),
                                          Text("Preview")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicWidth(
                                     child: Row(children: [
                                       Icon(Icons.info),
                                       Padding(
                                         padding: const EdgeInsets.only(left:10.0),
                                         child: Text("Details"),
                                       ),
                                     ],)
                                    ),
                                    Icon(Icons.arrow_forward_sharp)
                                  ],
                                ),
                              )

                            ],
                          ),
                        )
                        );
                      },
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
