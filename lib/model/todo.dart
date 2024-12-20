class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '1', todoText: "Morning Exercise", ),
      ToDo(id: '2', todoText: "Buy Groceries", ),
      ToDo(id: '3', todoText: "Check Emails",),
      ToDo(id: '4', todoText: "Lunch",),
      ToDo(id: '5', todoText: "Sleep",),
      ToDo(id: '6', todoText: "Dinner",),
    ];
  }
}