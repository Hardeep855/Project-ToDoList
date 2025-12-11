import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

Widget buildTaskList(
  List<Task> tasks,
  Function(int) removeTasks,
  Function(int, bool) updateTasks,
) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      final isEven = index % 2 == 0;

      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: isEven ? Colors.blue : Colors.green,
          leading: Icon(
            task.completed ? Icons.check_circle : Icons.circle_outlined,
          ),
          title: Text(
            task.name,
            style: TextStyle(
              decoration: task.completed ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            children: [
              Checkbox(
                value: task.completed,
                onChanged: (value) => updateTasks(index, value!),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeTasks(index),
              ),
            ],
          ),
        ),
      );
    },
  );
}
