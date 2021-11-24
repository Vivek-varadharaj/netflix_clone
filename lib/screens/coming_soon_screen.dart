import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';
import 'package:netflix_clone/widgets/coming_soon_tile.dart';

import '../api.dart';

class ComingSoonScreen extends StatefulWidget {
  ComingSoonScreen({Key? key}) : super(key: key);

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  List movies = [];
  final ValueNotifier<double> notifier = ValueNotifier(0);
  ScrollController scroll = ScrollController();

  void getMovies() async {
    movies = await Api.getDramayMovies("18");
    movies =movies.sublist(0,7);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: movies.length!=0 ? Padding(
          padding: const EdgeInsets.all(4.0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (n){
              if(scroll.position.userScrollDirection == ScrollDirection.forward || scroll.position.userScrollDirection == ScrollDirection.reverse ){
                   
                      // print(scroll.offset);
                      notifier.value =  scroll.offset;
                      // print(notifier.value);
                      
                      return true;
                   
                    
                   }
                   return true;
                    },
           
            child: CustomScrollView(
              controller: scroll,
              slivers: [
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.black,
                  title: Text("Coming Soon", style: StyleForApp.headingBold),
                  actions: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Image.network(
                        "https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u2.jpg",
                        width: 20,
                        height: 20,
                        
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.bell),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text("Notifications"),
                              )
                            ],
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                          ),
                        ]),
                  ),
                ),
                ...movies.map((e) => ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (context,value, child) {
                    return ComingSoonTile(e, notifier.value,movies.indexOf(e));
                  }
                )).toList(),
              ],
            
            ),
          ),
        ) : Center(child: Container(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),));
  }
}
