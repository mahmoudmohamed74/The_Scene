import 'package:the_scene/data/models/genres_model.dart';
import 'package:the_scene/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backDropPath,
    required super.genres,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.id,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backDropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(
          json["genres"].map(
            (x) => GenresModel.fromJson(x),
          ),
        ),
        overview: json["overview"],
        title: json["title"],
        releaseDate: json["release_date"],
        id: json["id"],
        runtime: json["runtime"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
