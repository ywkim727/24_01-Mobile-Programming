// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_todo_list/components/todo_item.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/todo_model.dart';
import 'package:simple_todo_list/screens/todo_modify_dialog.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = Todo.createDummyTodoList();

  final _todoAddBoxController = TextEditingController();
  final _todoSearchBoxController = TextEditingController();

  List<Todo> _searchedTodoItems = [];

  @override
  void initState() {  
    super.initState();
    _searchedTodoItems = todoList;
  }

  void _handleCheckTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      for (var todoItem in todoList) {
        if (todoItem.id == id) {
          todoList.remove(todoItem);
          return;
        }
      }
    });
  }

  void _addTodoItem (String todoContent) {
    if (todoContent.trim().isEmpty) { // 빈칸 입력 시 추가하지 않음
      return;
    }
    setState(() {
      todoList.insert(  // 리스트 맨 앞에 추가
        0,
        Todo(
          id: DateTime.now().toString(),
          todoContent: todoContent,
        )
      );
    });
    _todoAddBoxController.clear();  // 입력 후 텍스트 필드 초기화
  }

  void _filtrateTodoList(String keyword) {
    List<Todo> results = [];
    if(keyword.isEmpty) {
      results = todoList;
    } else {
      for (var todoItem in todoList) {
        if (todoItem.todoContent.toLowerCase().contains(keyword.toLowerCase())) {
          results.add(todoItem);
        }
      }
    }
    setState(() {
      _searchedTodoItems = results;
    });
  }

  void _showModifyPopup(Todo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const TodoModifyDialog();
      }, 
    );
  }

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
            _TodoSearchBox(
              controller: _todoSearchBoxController,
              onChanged: _filtrateTodoList,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _searchedTodoItems.length + 1, 
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                      ),
                      child: const Text(
                        '모든 할 일',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return TodoItem(
                    todo: _searchedTodoItems[index - 1], // index 0은 모든 할 일 텍스트이므로 -1
                    onCheckedTodo: _handleCheckTodoItem,
                    onDeleteTodo: _deleteTodoItem,
                    onModifyTodo: _showModifyPopup,
                  );
                },
                separatorBuilder: (context, index) {  //아이템 사이 간격 추가
                  if (index == 0) {
                    return const SizedBox.shrink();
                  }
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ),
            _TodoAddBox(
              controller: _todoAddBoxController,
              onSubmitted: _addTodoItem,
            ),
          ],
        ),
      ),
    );
  }
}

class _TodoSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const _TodoSearchBox({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: const InputDecoration(
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
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const _TodoAddBox({
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_rounded,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              onTapOutside: (_) {
                controller.clear();
              },
              decoration: const InputDecoration(
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
