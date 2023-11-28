class TodoModel {
  final String title;
  final String description;
  final bool completed;

  TodoModel({
    required this.title,
    required this.description,
    this.completed = false,
  });
}
