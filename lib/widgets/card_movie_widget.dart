import 'package:flutter/material.dart';
import 'package:mwatch/constant/api.dart';
import 'package:mwatch/models/movie.dart';

import '../screens/movie_details_screen.dart';

class CardMovieWidget extends StatelessWidget {
  const CardMovieWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(MovieDetailScreen.routeName, arguments: movie.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.network(
                MyApi.imageUrl(movie.posterPath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: FittedBox(
                    child: CircleAvatar(
                      child: Text(
                        movie.voteAverage.toString(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: const Alignment(0.0, -1.1),
                  ),
                ),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
