import 'package:app_rich_and_morty/models/location_type.model.dart';
import 'package:app_rich_and_morty/models/origin_type.model.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginType origin;
  final LocationType location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromMap(Map<String, dynamic> data) {
    return Character(
      id: data["id"],
      name: data["name"],
      status: data["status"],
      species: data["species"],
      type: data["type"],
      gender: data["gender"],
      origin: OriginType.fromMap(data["origin"]),
      location: LocationType.fromMap(data["location"]),
      image: data["image"],
      episode: data["episode"],
      url: data["url"],
      created: data["created"],
    );
  }
}
