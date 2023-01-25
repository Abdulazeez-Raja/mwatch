import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mwatch/constant/api.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../providers/movies.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/detail';
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  YoutubePlayerController? controller;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final provider = Provider.of<Movies>(context, listen: false);
    await provider.getMovieDetails(id.toString());
    var url = 'https://www.youtube.com/watch?v=${provider.videoKey}';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    );
    setState(() {
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    controller?.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Movies>(context, listen: false);
    return _isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller!,
            ),
            builder: (context, player) => Scaffold(
              appBar: AppBar(
                title: Text(provider.movie.title),
              ),
              body: ListView(
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.movie.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Release Date: ${DateFormat.yMMMd().format(
                            DateTime.parse(provider.movie.releaseDate),
                          )}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Text(
                          provider.movie.overview,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                'Vote Average: ${provider.movie.voteAverage.toStringAsFixed(1)}'),
                            Text('Vote Count: ${provider.movie.voteCount}'),
                          ],
                        ),
                        const Divider(),
                        Image.network(
                          MyApi.imageUrl(provider.movie.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
