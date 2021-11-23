import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/api.dart';
import 'package:netflix_clone/style/style.dart';
import 'package:netflix_clone/widgets/coming_soon_tile.dart';
import 'package:netflix_clone/widgets/download_three_stack.dart';
import 'package:netflix_clone/widgets/downloaded_widget.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  List movies = [];
  void getMovies() async {
    movies = await Api.getDramayMovies("18");
    movies = movies.sublist(0, 5);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            floating: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Downloads"),
                IntrinsicWidth(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, left: 10),
                        child: Image.network(
                          "https://www.iconsdb.com/icons/preview/white/active-search-xxl.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: .0, left: 20, right: 10),
                        child: Image.network(
                          "https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u2.jpg",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.black,
            titleSpacing: 20,
            elevation: 0,
            toolbarHeight: 20,
            collapsedHeight: 40,
            pinned: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  "Smart Downloads",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 0, left: 10),
                    child: Icon(
                      FontAwesomeIcons.pen,
                      size: 10,
                    )),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: .0, left: 10, right: 10),
                      child: Image.network(
                        "https://ih0.redbubble.net/image.618427277.3222/flat,1000x1000,075,f.u2.jpg",
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text("Vivek", style: StyleForApp.headingBold,),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          ...movies.map((e) => DownloadsWidget(e)).toList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Introducing Downloads for you",
                  style: StyleForApp.headingBold,
                ),
                SizedBox(height: 10),
                Text(
                  "We'll download a personalised selection of movies and shows for you, so there is something to watch on your phone",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          DownloadThreeStack(movies),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.shade900
                  ),
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text("SET UP"))),

                        SizedBox(height: 40,),

                        ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            primary: Color(0xff333333),
                          ),
                          onPressed: (){}, child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text("Find more to download",style: StyleForApp.heading,))),

                          SizedBox(height: 30,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
