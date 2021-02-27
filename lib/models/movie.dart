part of 'models.dart';

// catat data movie property
class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverange;
  final String overview;
  final String posterPath;
  final String backdropPath;

  // buat constructor
  Movie(
      {@required this.id,
      @required this.title,
      @required this.voteAverange,
      @required this.overview,
      @required this.posterPath,
      @required this.backdropPath});

  // fromJson movieServices
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      voteAverange: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path']);

  @override
  List<Object> get props =>
      [id, title, voteAverange, overview, posterPath, backdropPath];
}
