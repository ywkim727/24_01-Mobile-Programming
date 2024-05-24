import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        backgroundColor: TodoColors.background,
        leading: Icon(
          Icons.menu,
          color: TodoColors.black,
          size: 30,
        ),
        title: const Text('Todo List'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_circle,
              size: 36,
              color: TodoColors.point,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Container(
          child: const Column(
            children: [
              _TodoSearchBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodoSearchBox extends StatelessWidget {
  const _TodoSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '할일검색',
                hintStyle: TextStyle(
                  color: TodoColors.grey,
                  fontSize: 16,
                  height: 2,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
