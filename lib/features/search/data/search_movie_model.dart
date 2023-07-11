class SearchedMovieModel {
  int page;
  List<SearchResult> searchedResults;
  int totalPages;
  int totalResults;

  SearchedMovieModel({
    required this.page,
    required this.searchedResults,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchedMovieModel.fromJson(Map<String, dynamic> json) => SearchedMovieModel(
    page: json["page"],
    searchedResults: List<SearchResult>.from(json["results"].map((x) => SearchResult.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(searchedResults.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class SearchResult {
  bool adult;
  String? backdropPath;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String? posterPath;

  SearchResult({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    id: json["id"],
    name: json["name"],
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    posterPath: json["poster_path"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "id": id,
    "name": name,
    "original_language": originalLanguage,
    "original_name": originalName,
    "overview": overview,
    "poster_path": posterPath,
  };
}
