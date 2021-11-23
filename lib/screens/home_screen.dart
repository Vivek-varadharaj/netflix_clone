import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/style/style.dart';
import 'package:netflix_clone/widgets/app_bar_home_page.dart';
import 'package:netflix_clone/widgets/list_view_with_heading.dart';
import 'package:netflix_clone/widgets/list_view_with_stack.dart';
import 'package:netflix_clone/widgets/stack_poster_front.dart';

class HomeScreen extends StatefulWidget {
  List<dynamic> movies;
  HomeScreen(this.movies);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scroll = ScrollController();
  double? offset;
  double height = 100;
  final ValueNotifier<double> notifier = ValueNotifier(0);
  final ValueNotifier<double> notifierForBottom = ValueNotifier(0);
  Key homeKey = Key("0");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // scroll.addListener(_listner);
    notifier.value = 100;
    notifierForBottom.value = 0;
  }

 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: notifierForBottom,
        builder: (context, value, child) {
          return Scaffold(
            appBar:  AppBarHomePage.AppBarForHome(notifierForBottom:notifierForBottom, width:width, titleOne: "TV Shows", titleTwo: "Movies",titleThree: "Categories" ,appBarKey:homeKey),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (n) {
                    if(scroll.position.userScrollDirection == ScrollDirection.forward || scroll.position.userScrollDirection == ScrollDirection.reverse ){
                    if (n.metrics.pixels <= height) {
                      notifier.value = 100 - n.metrics.pixels;
                      notifierForBottom.value = n.metrics.pixels;
                      return true;
                    } else
                      notifier.value = 0;
                    return false;
                   }
                   return false; },
                  child: ListView(
                    controller: scroll,
                    padding: EdgeInsets.only(top: 0),
                    children: [
                      StackPoster(widget.movies[7]),
                      ListViewWithHeading( "Popular on Netflix", "35",170.00),
                      ListViewWithStack("Top 10 in India Today", widget.movies),
                      ListViewWithHeading( "Trending Now","80",170.00),
                      ListViewWithHeading("Only on Netflix","35",260),
                      
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  child: ValueListenableBuilder(
                      valueListenable: notifier,
                      builder: (context, value, child) {
                        return Container(
                          height: notifier.value,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0, left: 10),
                                child: Image.asset(
                                  "lib/assets/logo_netflix.png",
                                  width: 40,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20.0, left: 10),
                                      child: Image.network(
                                        "https://www.iconsdb.com/icons/preview/white/active-search-xxl.png",
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20.0, left: 20, right: 10),
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
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
