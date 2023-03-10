import 'package:dio/dio.dart';
import 'package:the_scene/app/error/exceptions.dart';
import 'package:the_scene/app/network/api_constants.dart';
import 'package:the_scene/app/network/error_message_model.dart';
import 'package:the_scene/data/models/movie_details_model.dart';
import 'package:the_scene/data/models/movie_model.dart';
import 'package:the_scene/data/models/recommendation_model.dart';
import 'package:the_scene/domain/usecases/get_movie_details.dart';
import 'package:the_scene/domain/usecases/get_recommendation.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  );
}

class MovieRemoteDataSourceImpl extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      ApiConstants.nowPlayingMoviesPath,
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      // choose result object from hole response
      // then trans it to list
      // then map each element in the list of results to movie Model
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
      ApiConstants.popularMoviesPath,
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      // choose result object from hole response
      // then trans it to list
      // then map each element in the list of results to movie Model
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
      ApiConstants.topRatedMoviesPath,
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      // choose result object from hole response
      // then trans it to list
      // then map each element in the list of results to movie Model
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.movieDetailsPathWithId(parameters.movieId),
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
    RecommendationParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.recommendationWithId(parameters.movieId),
      queryParameters: {
        "api_key": ApiConstants.apiKey,
      },
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
