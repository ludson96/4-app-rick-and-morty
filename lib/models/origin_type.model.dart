class OriginType {
  final String name;
  final String url;

  OriginType({required this.name, required this.url});

  factory OriginType.fromMap(Map<String, dynamic> data) {
    return OriginType(name: data["name"], url: data["url"]);
  }
}
