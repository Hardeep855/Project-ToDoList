import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';
import 'package:myapp/services/task_service.dart';
import 'package:myapp/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/screens/components/build_task_list.dart';
import 'package:myapp/screens/components/build_add_task_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();// task input 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,// header color 
        title: Row(
          children: [
            Expanded(child: Image.asset('assets/rdplogo.png', height: 80)),// logo 
            Text(
              'Daily Planner',// app title 
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),// side menu 
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.month,// month view 
            focusedDay: DateTime.now(),// current day 
            firstDay: DateTime(2025),// calender start
            lastDay: DateTime(2027),// calender end 
          ),
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildTaskList(
                taskProvider.tasks,// task list
                taskProvider.removeTask,//delete action 
                taskProvider.updateTask,// update action
              );
            },
          ),
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildAddTaskSection(nameController, 
              () async {
                await taskProvider.addTask(nameController.text);// add task 
                nameController.clear();// clear input
              });
            },
          ),
        ],
      ),
    );
  }
}
