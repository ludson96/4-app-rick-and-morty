class LocationType {
  final String name;
  final String url;

  LocationType({required this.name, required this.url});

  factory LocationType.fromMap(Map<String, dynamic> data) {
    return LocationType(name: data["name"], url: data["url"]);
  }
}
