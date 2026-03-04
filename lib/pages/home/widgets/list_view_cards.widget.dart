import 'package:app_rich_and_morty/colors.dart';
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
          child: SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.network(
                    character.image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          character.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: .w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
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
                        SizedBox(height: 5),
                        Text(
                          character.gender,
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ),
                        Align(
                          alignment: .centerRight,
                          child: Text("${character.id}"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
