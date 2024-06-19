import 'package:flutter/material.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Move to "$title" Screen');
      },
      leading: Icon(
        icon,
        color: TodoColors.point,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: TodoColors.black,
        ),
      ),
      trailing: const Text(
        '10',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}