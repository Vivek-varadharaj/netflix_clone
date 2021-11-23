class Movie{
  int id;
  String backdropPath;
  List<dynamic> genreIds;
  String name;
  String overview;
  Movie({required this.id,required this.backdropPath,required this.genreIds,required this.name,required this.overview});

  factory Movie.fromJson(Map json){
    return Movie(id: json["id"], backdropPath: json["backdrop_path"], genreIds: json["genre_ids"], name: json["title"], overview: json["overview"]);
  }

}