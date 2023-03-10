import 'package:flutter/material.dart';
import 'package:the_scene/app/app_strings.dart';
import 'package:the_scene/app/services/services_locator.dart';
import 'package:the_scene/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff303030)),
      home: const MainMoviesScreen(),
    );
  }
}
