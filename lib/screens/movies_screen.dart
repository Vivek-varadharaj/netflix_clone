import 'package:flutter/material.dart';

import 'package:netflix_clone/widgets/app_bar_other_screens.dart';
import 'package:netflix_clone/widgets/list_view_with_heading.dart';
import 'package:netflix_clone/widgets/stack_poster_front.dart';

class MoviesScreen extends StatelessWidget {
   MoviesScreen({ Key? key }) : super(key: key);
  final ValueNotifier<double> notifierForBottom = ValueNotifier(0);
  Key appBarKey = Key("2");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBarOtherScreens.AppBarForOtherScreens(notifierForBottom: notifierForBottom, width: width, appBarKey: appBarKey, titleOne: "Movies"),
      body:ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
        StackPoster("https://www.al.com/resizer/bwSiSIphZdV4msuJFLaeCGlXIJQ=/1280x0/smart/advancelocal-adapter-image-uploads.s3.amazonaws.com/expo.advance.net/img/27ecb43233/width2048/ad5_angelhasfallen.jpeg"),
        ListViewWithHeading("Highest Grossing","35",170.00),
        ListViewWithHeading("Top Rated","80",170.00),
        
      ],)
    );
  }
}