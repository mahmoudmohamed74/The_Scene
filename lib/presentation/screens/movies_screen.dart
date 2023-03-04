import 'package:flutter/material.dart';
import 'package:the_scene/data/datasource/remote_datasource.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    test();
    super.initState();
  }

  void test() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSourceImpl();
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IconButton(
        onPressed: () async {},
        icon: const Icon(Icons.sanitizer),
      ),
    );
  }
}
