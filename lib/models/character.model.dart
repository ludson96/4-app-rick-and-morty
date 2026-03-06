import 'package:app_rich_and_morty/models/location_type.model.dart';
import 'package:app_rich_and_morty/models/origin_type.model.dart';
import 'package:flutter/material.dart';

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
  final Color color;

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
    this.color = Colors.white,
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
      episode: List<String>.from(data["episode"]),
      url: data["url"],
      created: DateTime.parse(data["created"]),
    );
  }

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    OriginType? origin,
    LocationType? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
    Color? color,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
      color: color ?? this.color,
    );
  }
}
