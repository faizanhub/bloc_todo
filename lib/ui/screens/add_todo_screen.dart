import 'package:bloc_todo/core/blocs/todo_bloc.dart';
import 'package:bloc_todo/core/blocs/todo_state.dart';
import 'package:bloc_todo/core/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleC = TextEditingController();
    final descriptionC = TextEditingController();
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleC,

                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'title'
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: descriptionC,

                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                        hintText: 'description'

                    ),
                  ),
                  ElevatedButton(onPressed: () {

                    context.read<TodoBloc>().add(AddTodoEvent(todoItem: TodoModel(title: titleC.text, description: descriptionC.text)));
                    Navigator.pop(context);
                  }, child: Text('Add'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
