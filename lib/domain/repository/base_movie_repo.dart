import 'package:dartz/dartz.dart';
import 'package:the_scene/app/error/failure.dart';
import 'package:the_scene/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
}
