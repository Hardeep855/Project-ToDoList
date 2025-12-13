import 'package:flutter/material.dart';
import 'package:myapp/services/task_service.dart';
import 'package:myapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final TaskService taskService = TaskService();//backend service 
  List<Task> tasks = [];// task list 

  Future<void> loadTasks() async {
    tasks = await taskService.fetchtasks();// fetch all tasks
    notifyListeners(); // update UI
  }

  Future<void> addTask(String name) async {
    if (name.trim().isNotEmpty) {
      final id = await taskService.addTask(name.trim());// save task
      tasks.add(Task(id: id, name: name.trim(), completed: false));// local add
      notifyListeners();// refresh UI
    }
  }

  Future<void> updateTask(int index, bool completed) async {
    final task = tasks[index];// get task 
    await taskService.updateTask(task.id, completed);// update backend 
  }

  Future<void> removeTask(int index) async {
    final task = tasks[index];// get task 
    await taskService.deleteTask(task.id);// delete backend 
    notifyListeners();//refresh UI
  }
}

