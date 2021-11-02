import 'package:flutter/material.dart';

class AudioPageArguments {
  final int id;
  final String name;

  AudioPageArguments({
    required this.id,
    required this.name,
  });
}

class AudioPage extends StatelessWidget {
  static const routeName = '/audio_page';

  final int id;
  final String name;

  const AudioPage({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
