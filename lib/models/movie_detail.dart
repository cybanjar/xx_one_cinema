part of 'models.dart';

class MovieDetail extends Movie {
  final List<String> genres;
  final String language;

  // manggil movie parent pake : suport jangan lupa di extends Movieclassparent
  MovieDetail(Movie movie, {this.genres, this.language})
      : super(
            id: movie.id,
            title: movie.title,
            voteAverange: movie.voteAverange,
            overview: movie.overview,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath);

  // buat genre dan language
  String get genresAndLanguage {
    String s = "";

    for (var genre in genres) {
      s += genre + (genre != genres.last ? ', ' : '');
    }

    return "$s - $language";
  }

  @override
  List<Object> get props => super.props + [genres, language];
}
