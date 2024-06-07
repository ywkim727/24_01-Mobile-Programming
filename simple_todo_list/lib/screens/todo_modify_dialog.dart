import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class TodoModifyDialog extends StatelessWidget {
  const TodoModifyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      title: Text(
        '할 일 수정',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      ), 
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.edit_note_rounded,
            size: 28,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TextField(
                minLines: 1,
                maxLines: 3,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
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
        Text(
          '완료',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: TodoColors.point,
          ),
        )
      ],
    );
  }
}