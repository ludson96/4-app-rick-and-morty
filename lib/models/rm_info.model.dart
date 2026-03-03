class RMInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  RMInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory RMInfo.fromMap(Map<String, dynamic> data) {
    return RMInfo(
      count: data["count"],
      pages: data["pages"],
      next: data["next"],
      prev: data["prev"],
    );
  }
}
