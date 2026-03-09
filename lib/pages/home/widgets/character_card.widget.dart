import 'package:app_rich_and_morty/colors.dart';
import 'package:app_rich_and_morty/models/character.model.dart';
import 'package:app_rich_and_morty/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';

class CharacterCard extends StatefulWidget {
  final HomeStore store;
  final Character character;
  final bool isGrid;

  const CharacterCard({
    super.key,
    required this.store,
    required this.character,
    this.isGrid = false,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  void initState() {
    super.initState();
    _extractColor();
  }

  Future<void> _extractColor() async {
    try {
      if (widget.character.color != Colors.white) return;

      final palette = await PaletteGeneratorMaster.fromImageProvider(
        NetworkImage(widget.character.image),
      );

      if (mounted && palette.dominantColor != null) {
        widget.store.updateCharacterColor(
          characterId: widget.character.id,
          color: palette.dominantColor!.color,
        );
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final character = widget.character;

    return Card(
      elevation: 10,
      color: character.color,
      child: widget.isGrid
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${character.id}"),
                Image.network(character.image, height: 130, width: 130),
                Text(
                  character.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    character.image,
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: character.status == "Alive"
                                    ? Colors.green
                                    : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${character.status} - ${character.species}",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          character.gender,
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${character.id}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
