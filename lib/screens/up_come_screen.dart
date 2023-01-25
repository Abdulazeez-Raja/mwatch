import 'package:flutter/material.dart';
import 'package:mwatch/widgets/up_coming_widget.dart';

class SeeMoreUpComeScreen extends StatelessWidget {
  static const routeName = '/upcome';
  const SeeMoreUpComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Up Come Movie'),
      ),
      body: const UpComingWidget(
        limt: false,
      ),
    );
  }
}
