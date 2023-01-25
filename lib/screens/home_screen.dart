import 'package:flutter/material.dart';
import 'package:mwatch/widgets/popular_widget.dart';
import 'package:mwatch/widgets/top_rated_widget.dart';

import '../widgets/now_playing_widget.dart';
import '../widgets/up_coming_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MWATCH'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const NowPlayingWidget(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const UpComingWidget(limt: true),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const TopRatedWidget(limt: true),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const PopularWidget(limt: true),
          ),
        ],
      ),
    );
  }
}
