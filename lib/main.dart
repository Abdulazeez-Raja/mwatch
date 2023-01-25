import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/movies.dart';
import 'screens/home_screen.dart';
import 'screens/movie_details_screen.dart';
import 'screens/popular_screen.dart';
import 'screens/up_come_screen.dart';
import 'screens/top_rated_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Movies(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(useMaterial3: true),
        home: const HomeScreen(),
        routes: {
          SeeMoreUpComeScreen.routeName: (context) =>
              const SeeMoreUpComeScreen(),
          TopRatedScreen.routeName: (context) => const TopRatedScreen(),
          PopularScreen.routeName: (context) => const PopularScreen(),
          MovieDetailScreen.routeName: (context) => const MovieDetailScreen(),
        },
      ),
    );
  }
}
