import 'package:app_rich_and_morty/models/character.model.dart';
import 'package:app_rich_and_morty/models/rm_info.model.dart';

class CharacterResponse {
  final RMInfo info;
  final List<Character> results;

  CharacterResponse({required this.info, required this.results});

  factory CharacterResponse.fromMap(Map<String, dynamic> data) {
    return CharacterResponse(
      info: RMInfo.fromMap(data["info"]),
      results: (data["results"] as List)
          .map((character) => Character.fromMap(character))
          .toList(),
    );
  }
}
