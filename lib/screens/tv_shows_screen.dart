import 'package:flutter/material.dart';

import 'package:netflix_clone/widgets/app_bar_other_screens.dart';

class TvShowsScreen extends StatelessWidget {
  Key appBarKey = Key("1");
   TvShowsScreen({ Key? key }) : super(key: key);
   final ValueNotifier<double> notifier = ValueNotifier(0);
  final ValueNotifier<double> notifierForBottom = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(home: Scaffold(
   backgroundColor: Colors.black,
      appBar: AppBarOtherScreens.AppBarForOtherScreens(notifierForBottom: notifierForBottom, width: width,appBarKey: appBarKey,titleOne: "TV Shows"),
    )) ;
  }
}