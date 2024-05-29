class Todo{

  String id;
  String todoContent;
  bool isDone;

  Todo({
    required this.id,
    required this.todoContent,
    this.isDone = false,
  });
  
  static List<Todo> createDummyTodoList() {
    return[
      Todo(id: '01',todoContent: 'Dart 공부하기',isDone: true),
      Todo(id: '02',todoContent: 'Flutter Framework 이해하기',isDone: true),
      Todo(id: '03',todoContent: 'StatefulWidget공부하기'),
      Todo(id: '04',todoContent: '거래처연락하기'),
      Todo(id: '05',todoContent: '메일확인하기'),
      Todo(id: '06',todoContent: '마트장보기'),
      Todo(id: '07',todoContent: '은행업무보기'),
      Todo(id: '08',todoContent: '운동하기'),
      Todo(id: '09',todoContent: '숙소예약하기'),
      Todo(id: '10',todoContent: '식당예약하기'),
    ];
  }
}