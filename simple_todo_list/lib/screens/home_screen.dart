import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_todo_list/components/todo_item.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/todo_model.dart';

class HomeScreen extends StatelessWidget {
  List<Todo> todoList = Todo.createDummyTodoList();

  HomeScreen({super.key});

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
        padding: EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Column(
          children: [
            const _TodoSearchBox(),
            Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    child: Text(
                      '모든 할 일',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),        
                  for (var todoItem in todoList)
                    TodoItem(todo: todoItem),         
                ],
              ),
            ),
            const _TodoAddBox(),
          ],
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

class _TodoAddBox extends StatelessWidget {
  const _TodoAddBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.add_rounded,
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
                hintText: '할 일 추가',
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
