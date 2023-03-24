// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todosController = TextEditingController();

  List<Todo> todos = [];
  Todo? deleteTodo;
  int? deleteTodoPos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todosController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Estudar flutter',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff000000),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: () {
                        String text = todosController.text;
                        setState(() {
                          Todo newTodo = Todo(
                            tile: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                        todosController.clear();
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child:
                          Text('Você possui ${todos.length} tarefas pendentes'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff000000),
                        padding: EdgeInsets.all(14),
                      ),
                      onPressed: showDeleteTodosConfirmation,
                      child: Text('Limpar Tudo'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteTodosConfirmation() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text('Limpar tudo?'),
            content:
                Text('Você tem certeza que deseja apagar todas as tarefas?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar '),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  deleteAllTodos();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text('Limpar tudo'),
              ),
            ],
          )),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
  }

  void onDelete(Todo todo) {
    deleteTodo = todo;
    deleteTodoPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.tile} foi removida com sucesso!',
          style: TextStyle(
            color: Color(0xff060708),
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(deleteTodoPos!, deleteTodo!);
            });
          },
          textColor: const Color(0xff00d7f3),
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
