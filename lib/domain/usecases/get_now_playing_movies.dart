import 'package:dartz/dartz.dart';
import 'package:the_scene/app/error/failure.dart';
import 'package:the_scene/domain/entities/movie.dart';
import 'package:the_scene/domain/repository/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
