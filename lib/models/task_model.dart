// data model for tasks

class Task {
  //task id 
  final String id;
  //task name
  final String name;
  //completion status 
  final bool completed;

  Task({required this.id, required this.name, required this.completed});

  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id, //map id
      name: data['name'] ?? '',//map name 
      completed: data['completed'] ?? false,// map status 
    );
  }
}