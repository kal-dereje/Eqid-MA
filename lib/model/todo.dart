class Todo {
  String? id;
  String? todoText;
  String? description;
  int? time;
  bool? isDone;
  Todo({
    required this.id,
    required this.todoText,
    required this.description,
    required this.time,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(
          id: '1',
          todoText: 'unix',
          description: 'need to work on it',
          time: DateTime.april),
      Todo(
          id: '1',
          todoText: 'unix',
          description: 'need to work on it',
          time: DateTime.april),
      Todo(
          id: '1',
          todoText: 'unix',
          description: 'need to work on it',
          time: DateTime.april),
      Todo(
          id: '1',
          todoText: 'unix',
          description: 'need to work on it',
          time: DateTime.april)
    ];
  }
}
