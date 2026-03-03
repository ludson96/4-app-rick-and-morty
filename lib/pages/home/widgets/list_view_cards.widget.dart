import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

class ListViewCards extends StatelessWidget {
  final HomeStore store;

  const ListViewCards({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.character.length,
      itemBuilder: (ctx, index) {
        final character = store.character[index];

        return Card(
          elevation: 10,
          child: Row(
            children: [
              Image.asset(character.image, height: 200, width: 100),
            ],
          ),
        );
      },
    );
  }
}
