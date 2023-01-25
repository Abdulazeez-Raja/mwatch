import 'package:flutter/material.dart';

import '../widgets/popular_widget.dart';

class PopularScreen extends StatelessWidget {
  static const routeName = '/popular';

  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movie'),
      ),
      body: const PopularWidget(limt: false),
    );
  }
}
