// class that handles all our CRUD operations with Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/task_model.dart';

class TaskService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List<Task> tasks = [];

  //fetch all teh tasks from the database and convert them to a list of objects
  Future<List<Task>> fetchtasks() async {
    final snapshot = await db.collection('tasks').orderBy('timestamp').get();
    return snapshot.docs
        .map((doc) => Task.fromMap(doc.id, doc.data()))
        .toList();
  }

  //future  to add tasks
  Future<String> addTask(String name) async {
    final newTask = {
      'name': name,
      'container': false,
      'timestamp': FieldValue.serverTimestamp(),
    };
    final docRef = await db.collection('tasks').add(newTask);
    return docRef.id;
  }

  //future to updated competed status (bool) of task
  Future<void> updateTask(String id, bool completed) async {
    await db.collection('task').doc(id).update({'completed': completed});
  }

  Future<void> deleteTask(String id) async {
    await db.collection('tasks').doc(id).delete();
  }
}