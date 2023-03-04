import 'package:flutter/material.dart';
import 'package:the_scene/presentation/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Scene',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviesScreen(),
    );
  }
}
