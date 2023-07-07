
import 'package:flutter/material.dart';

import 'ItemMusic.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemMusic(),
          ItemMusic(),
          ItemMusic(),
          ItemMusic(),
          ItemMusic(),
        ],
      ),
    );
  }
}