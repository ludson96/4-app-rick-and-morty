import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:app_rich_and_morty/pages/home/widgets/character_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListViewCards extends StatelessWidget {
  final HomeStore store;

  const ListViewCards({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: store.character.length,
          itemBuilder: (ctx, index) {
            final character = store.character[index];
            return CharacterCard(store: store, character: character);
          },
        );
      },
    );
  }
}
