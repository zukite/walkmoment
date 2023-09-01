import 'package:flutter/material.dart';

class WalkCard extends StatelessWidget {
  final String content;

  const WalkCard({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Content(content: content),
          const SizedBox(width: 16.0),
        ],
      )),
    );
  }
}

class _Content extends StatelessWidget {
  final String content;

  const _Content({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}
