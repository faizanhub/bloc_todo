import 'package:bloc_todo/core/models/todo_model.dart';
import 'package:equatable/equatable.dart';


class TodoState extends Equatable {

  final List<TodoModel> items;

  const TodoState({required this.items});

  @override
  List<Object?> get props => [items];
}

class TodoInitialState extends TodoState {
  const TodoInitialState() : super(items: const []);
}

