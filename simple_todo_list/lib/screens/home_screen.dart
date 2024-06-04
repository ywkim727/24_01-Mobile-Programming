import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_todo_list/components/todo_item.dart';
import 'package:simple_todo_list/constants/todo_colors.dart';
import 'package:simple_todo_list/models/todo_model.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = Todo.createDummyTodoList();

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
              child: ListView.separated(
                itemCount: todoList.length + 1, 
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
                    todo: todoList[index - 1], // index 0은 모든 할 일 텍스트이므로 -1
                    onCheckedTodo: _handleCheckTodoItem,
                    onDeleteTodo: _deleteTodoItem,
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
