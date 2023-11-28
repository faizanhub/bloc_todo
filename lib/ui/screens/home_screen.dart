import 'package:bloc_todo/core/blocs/todo_bloc.dart';
import 'package:bloc_todo/core/blocs/todo_state.dart';
import 'package:bloc_todo/core/models/todo_model.dart';
import 'package:bloc_todo/ui/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        print(state.items.length);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTodoScreen()));
              },
              child: Icon(Icons.add),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return Card(
                            // shadowColor: Colors.green,
                            child: ListTile(
                              onTap: () {
                                context
                                    .read<TodoBloc>()
                                    .add(RemoveTodoEvent(todoItem: item));
                              },
                              title: Text(item.title),
                              subtitle: Text(item.description),
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      },
    );
  }
}
