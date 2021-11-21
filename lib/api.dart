import 'dart:convert';

import 'package:http/http.dart' as http;

class Api{
  static const url = "https://api.themoviedb.org/3/";
  static const apiKey = "070180315e67616c89018d2d663a53eb";
  
 static Future getActionMovies() async{
final response = await http.get(Uri.parse(
      url + 'discover/movie?api_key=' + apiKey + '&with_genres=80'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  } else {
    throw Exception('Failed to load album');
  }
}

static Future getDramayMovies(id) async{
  try{
    final response = await http.get(Uri.parse(
      url + 'discover/movie?api_key=' + apiKey + '&with_genres=$id'));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  }
  }
  catch(e){
    
  }
}


static Future getMoviesWithVideos() async{
  try{
    final response = await http.get(Uri.parse(
 "https://api.themoviedb.org/3/trending/all/day?api_key=070180315e67616c89018d2d663a53eb&append_to_response=videos"));
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData['results'];
  }
  }
  catch(e){
    return [];
  }
}






  }


class GenreModel {
  final String? name;
  final int? id;

  GenreModel({this.name, this.id});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

