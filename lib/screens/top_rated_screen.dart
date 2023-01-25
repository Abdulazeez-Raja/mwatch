import 'package:flutter/material.dart';
import 'package:mwatch/widgets/top_rated_widget.dart';

class TopRatedScreen extends StatelessWidget {
  static const routeName = '/toprated';

  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movie'),
      ),
      body: const TopRatedWidget(limt: false),
    );
  }
}
