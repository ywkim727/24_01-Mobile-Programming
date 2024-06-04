import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onCheckedTodo;
  final Function(String) onDeleteTodo;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onCheckedTodo,
    required this.onDeleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(
      //   bottom: 5,
      // ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(),
            icon: todo.isDone
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank), 
            highlightColor: Colors.transparent,
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            color: TodoColors.point,
            iconSize: 28,
            onPressed: () {
              print('체크박스 클릭됨');
              onCheckedTodo(todo);
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              alignment: Alignment.centerLeft,
              child : Text(
                todo.todoContent,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: TodoColors.black,
                  fontWeight: FontWeight.w500,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,  //체크박스 클릭시 글자에 줄 긋기
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:  TodoColors.point,
            ),
            child: IconButton(
              onPressed: () {
                print('더보기 클릭됨');
                onDeleteTodo(todo.id);
              },
              icon: const Icon(
                Icons.delete,
              ),
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(),
              highlightColor: Colors.transparent,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              color: Colors.white,
              iconSize: 18,
            ),
          ),
        ],
      ),

    );
  }
}