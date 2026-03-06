import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:app_rich_and_morty/pages/home/widgets/character_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GridViewCards extends StatelessWidget {
  final HomeStore store;

  const GridViewCards({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:
                0.75, // Ajuste conforme necessário para a altura do card
          ),
          itemCount: store.character.length,
          itemBuilder: (ctx, index) {
            final character = store.character[index];
            return CharacterCard(
              store: store,
              character: character,
              isGrid: true,
            );
          },
        );
      },
    );
  }
}