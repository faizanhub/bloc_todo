import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_todo/core/blocs/todo_state.dart';
import 'package:bloc_todo/core/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitialState()) {

    on<AddTodoEvent>((event, emit) {
      emit(TodoState(items: [...state.items, event.todoItem]));
    });

    on<RemoveTodoEvent>((event, emit) {
      final updatedItems =
          state.items.where((item) => item != event.todoItem).toList();

      emit(TodoState(items: updatedItems));
    });
  }
}
