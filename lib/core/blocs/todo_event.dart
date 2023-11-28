part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final TodoModel todoItem;

  const AddTodoEvent({required this.todoItem});

  @override
  // TODO: implement props
  List<Object> get props => [todoItem];
}

class RemoveTodoEvent extends TodoEvent {
  final TodoModel todoItem;

  const RemoveTodoEvent({required this.todoItem});

  @override
  // TODO: implement props
  List<Object> get props => [todoItem];
}
