import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import 'card_movie_widget.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Movies>(context, listen: false);
    return FutureBuilder(
      future: provider.getNowPlaying(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2 / 1.2,
              mainAxisSpacing: 10,
            ),
            itemCount: provider.nowPlaying.length,
            itemBuilder: (context, index) {
              return CardMovieWidget(
                movie: provider.nowPlaying[index],
              );
            },
          );
        }
      },
    );
  }
}
