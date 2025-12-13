import 'package:flutter/material.dart';
import 'package:myapp/services/task_service.dart';

Widget buildAddTaskSection( TextEditingController nameController,
 VoidCallback addTask) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),// section background 
    child: Padding(
      padding: const EdgeInsets.all(12.0),// inner spacing 
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                maxLength: 32,// name limit 
                controller: nameController,// input controller 
                decoration: const InputDecoration(
                  labelText: 'Add Task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: Text("Add Task"),// trigger add
          ),
        ],
      ),
    ),
  );
}
