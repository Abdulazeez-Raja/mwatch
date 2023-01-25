import 'package:flutter/material.dart';
import 'package:mwatch/screens/top_rated_screen.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import 'card_movie_widget.dart';

class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({super.key, required this.limt});
  final bool limt;

  @override
  State<TopRatedWidget> createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  int page = 1;
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();

    fetch();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    setState(() {
      page++;
    });
    await Provider.of<Movies>(context, listen: false).getTopRated(page);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
      builder: (context, provider, child) {
        return Column(
          children: [
            widget.limt == true
                ? ListTile(
                    title: const Text('Top Rated Movie'),
                    trailing: TextButton(
                      child: const Text('See More'),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(TopRatedScreen.routeName),
                    ),
                  )
                : Container(),
            Expanded(
              child: GridView.builder(
                controller: widget.limt == true ? null : controller,
                scrollDirection:
                    widget.limt == true ? Axis.horizontal : Axis.vertical,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.limt == true ? 1 : 2,
                  childAspectRatio: widget.limt == true ? 2 / 1.2 : 1 / 1.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: widget.limt == true ? 0 : 10,
                ),
                itemCount: (widget.limt == true
                    ? (provider.topRated.length > 10
                        ? 10
                        : provider.topRated.length)
                    : provider.topRated.length + 1),
                itemBuilder: (context, index) {
                  if (widget.limt == true) {
                    return CardMovieWidget(
                      movie: provider.topRated[index],
                    );
                  } else {
                    if (index < provider.topRated.length) {
                      return CardMovieWidget(
                        movie: provider.topRated[index],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
