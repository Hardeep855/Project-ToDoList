import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

Widget buildTaskList(
  List<Task> tasks,
  Function(int) removeTasks,
  Function(int, bool) updateTasks,
) {
  return ListView.builder(
    shrinkWrap: true,// fit content 
    physics: NeverScrollableScrollPhysics(),// disable scroll
    itemCount: tasks.length,// total tasks 
    itemBuilder: (context, index) {
      final task = tasks[index]; // current task 
      final isEven = index % 2 == 0;// row color 

      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: isEven ? Colors.blue : Colors.green,// alternating color 
          leading: Icon(
            task.completed ? Icons.check_circle : Icons.circle_outlined,// status icon 
          ),
          title: Text(
            task.name,
            style: TextStyle(
              decoration: task.completed ? TextDecoration.lineThrough : null,// strike task
            ),
          ),
          trailing: Row(
            children: [
              Checkbox(
                value: task.completed,
                onChanged: (value) => updateTasks(index, value!),// toggle task 
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeTasks(index),// delete task 
              ),
            ],
          ),
        ),
      );
    },
  );
}
