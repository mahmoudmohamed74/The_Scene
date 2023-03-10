import 'package:equatable/equatable.dart';
import 'package:the_scene/domain/entities/geners.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final List<Genres> genres;
  final String overview;
  final String title;
  final String releaseDate;
  final int id;
  final int runtime;
  final double voteAverage;

  const MovieDetails({
    required this.backDropPath,
    required this.genres,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.id,
    required this.runtime,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      backDropPath,
      genres,
      overview,
      title,
      releaseDate,
      id,
      runtime,
      voteAverage,
    ];
  }
}
