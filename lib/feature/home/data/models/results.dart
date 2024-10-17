class Results {
  final int id;
  final List genreIds;
  final String originalTitle;
  final double popularity;
  final String? posterPath;
  final String title;
  final int voteCount;
  final String overview;

  Results(
      {required this.id,
      required this.genreIds,
      required this.originalTitle,
      required this.popularity,
      required this.posterPath,
      required this.title,
      required this.voteCount,
      required this.overview});

  factory Results.fromJson(json) {
    return Results(
        id: json["id"],
        genreIds: ["genre_ids"],
        originalTitle: json["original_title"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        title: json["title"],
        voteCount: json["vote_count"],
        overview: json["overview"]);
  }
}
