import 'package:flutter/material.dart';
import 'package:the_scene/presentation/screens/movies_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesScreen(),
    );
  }
}
