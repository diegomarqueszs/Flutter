class Todo {
  Todo({required this.tile, required this.dateTime});

  Todo.fromJson(Map<String, dynamic> json)
      : tile = json['title'],
        dateTime = DateTime.parse(json['dateTime']);

  String tile;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    return {
      'title': tile,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
