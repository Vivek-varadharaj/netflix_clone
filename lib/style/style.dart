import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleForApp {
  static TextStyle heading = TextStyle(color: Colors.white, fontSize: 16);
  static TextStyle headingBold = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingBlack = TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle small = TextStyle(color: Colors.white, fontSize: 12);
  static TextStyle smallShade = TextStyle(color: Colors.grey, fontSize: 12);
  static TextStyle hollow = TextStyle(
    
    color: Colors.black87, fontSize:100,
    fontWeight: FontWeight.bold,
    shadows: [Shadow(
      color: Colors.white,
      blurRadius: 8,
    )]
  );
}
