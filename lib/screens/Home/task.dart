class TodoTasks {
  String? id;
  String? name;
  String? description;
  bool? isDone;
  String? time;
  String? date;

  TodoTasks({
    required this.id,
    required this.date,
    required this.time,
    required this.description,
    required this.name,
    this.isDone = false,
  });

  static List<TodoTasks> tasklist() {
    return [
      TodoTasks(
          id: '1',
          name: 'unix',
          time: '10:30',
          date: '2/4/2023',
          isDone: false,
          description: 'zoom meeting'),
      TodoTasks(
          id: '2',
          name: 'Ai',
          time: '7:30',
          date: '2/4/2023',
          isDone: true,
          description: 'zoom meeting'),
      TodoTasks(
          id: '3',
          name: 'Assembly',
          time: '4:30',
          date: '2/4/2023',
          description: 'zoom meeting'),
      TodoTasks(
          id: '4',
          name: 'operating system',
          time: '2:30',
          date: '2/4/2023',
          description: 'zoom meeting'),
      TodoTasks(
          id: '5',
          name: 'graphics',
          time: '1:30',
          date: '2/4/2023',
          isDone: true,
          description: 'zoom meeting')
    ];
  }
}
