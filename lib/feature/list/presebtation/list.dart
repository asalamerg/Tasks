
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';
import 'package:tasks/feature/list/presebtation/tasksItems.dart';
import 'package:table_calendar/table_calendar.dart';
class Lists extends StatelessWidget{
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    List<TasksModel> tasks=List.generate(10, (index)=>TasksModel(title: "title $index ", description: "description $index", dateTime: DateTime.now()));

    return  SafeArea(
      child: Column(children: [
       TableCalendar(
           focusedDay:  DateTime.now(),
           firstDay: DateTime.now().subtract(Duration(days: 30)),
           lastDay: DateTime.now().add(Duration(days: 30)),
         onPageChanged: (data){},

       ),


       SizedBox(height: 22 ,),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=> TasksItems(tasksModel:tasks[index],), itemCount: tasks.length,))
      
      ],),
    );


  }
}

