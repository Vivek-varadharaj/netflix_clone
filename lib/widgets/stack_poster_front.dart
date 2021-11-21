import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_clone/style/style.dart';

class StackPoster extends StatelessWidget {
  String posterPath;
  StackPoster(this.posterPath);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.68,
          child: Image.network(
            posterPath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.68,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.5),
              Colors.black,
              Colors.black,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            // height: 300,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Exciting",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Icon(
                            FontAwesomeIcons.ggCircle,
                            color: Colors.red,
                            size: 4,
                          ),
                        ),
                        Text(
                          "Suspensful",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Icon(
                            FontAwesomeIcons.ggCircle,
                            color: Colors.red,
                            size: 4,
                          ),
                        ),
                        Text(
                          "Action",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Icon(
                            FontAwesomeIcons.ggCircle,
                            color: Colors.red,
                            size: 4,
                          ),
                        ),
                        Text(
                          "Adventure",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "My List",
                              style: StyleForApp.small,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                child: IntrinsicWidth(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Play",
                                      style: StyleForApp.headingBlack,
                                    ),
                                  ],
                                )))
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.info_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "info",
                              style: StyleForApp.small,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
