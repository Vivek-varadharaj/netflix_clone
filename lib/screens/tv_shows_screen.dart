import 'package:flutter/material.dart';
import 'package:netflix_clone/api.dart';
import 'package:netflix_clone/json_parsing_classes/movie_model.dart';

import 'package:netflix_clone/widgets/app_bar_other_screens.dart';

class TvShowsScreen extends StatefulWidget {
  TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  Key appBarKey = Key("1");

  final ValueNotifier<double> notifier = ValueNotifier(0);

  final ValueNotifier<double> notifierForBottom = ValueNotifier(0);

  List movies = [];
  List<Movie> movieObjects = [];

  void getMovies() async {
    movies = await Api.getDramayMovies("18");
    print(movies);
    movieObjects = movies.map((e) => Movie.fromJson(e)).toList();
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
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBarOtherScreens.AppBarForOtherScreens(
            notifierForBottom: notifierForBottom,
            width: width,
            appBarKey: appBarKey,
            titleOne: "TV Shows"),
            body: movieObjects.length !=0 ? ListView.builder(
              itemCount: movieObjects.length,
              itemBuilder: (context,index)=> Text(movieObjects[index].name,style: TextStyle(color:Colors.white),)):Container(),
      ),
    );
  }
}
