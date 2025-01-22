class ToDo {
  String? todoText;
  bool isDone;

  ToDo({
    required this.todoText,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {"title": todoText, "isDone": isDone};
  }

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      todoText: json["title"],
      isDone: json["isDone"],
    );
  }
}
