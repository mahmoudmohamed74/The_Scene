import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_scene/app/services/services_locator.dart';
import 'package:the_scene/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:the_scene/presentation/controller/movie_details_bloc/movie_details_event.dart';
import 'package:the_scene/presentation/widgets/movie_details_widgets/movie_details_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        // pass id to event to fire request
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecommendationsEvent(id)),
      lazy: false,
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}
