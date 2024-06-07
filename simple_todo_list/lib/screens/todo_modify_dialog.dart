import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/todo_model.dart';

class TodoModifyDialog extends StatelessWidget {
  final Todo todo;
  final Function(String, Todo) onModifiedTodo;

  const TodoModifyDialog({
    super.key,
    required this.todo,
    required this.onModifiedTodo,
  });

  @override
  Widget build(BuildContext context) {
    final TodoModifyDialogController = TextEditingController.fromValue(
      TextEditingValue(
        text: todo.todoContent,
      ),
    );
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      title: const Text(
        '할 일 수정',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      ), 
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.edit_note_rounded,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: TodoModifyDialogController,
                onSubmitted: (modifiedTodoContent) {
                  onModifiedTodo(modifiedTodoContent, todo);
                },
                autofocus: true,  // 다이얼로그가 열리면 키보드가 자동으로 올라옴
                minLines: 1,
                maxLines: 3,
                textInputAction: TextInputAction.done,  // 키보드 완료 버튼
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '할 일 수정',
                ),
              ),
            ) 
          )
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            onModifiedTodo(TodoModifyDialogController.text, todo);
          },
          child: const Text(
            '완료',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: TodoColors.point,
            ),
          ),
        )
      ],
    );
  }
}