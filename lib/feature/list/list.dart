
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/tasksItems.dart';
import 'package:table_calendar/table_calendar.dart';
class Lists extends StatelessWidget{
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(children: [
       TableCalendar(
           focusedDay:  DateTime.now(),
           firstDay: DateTime.now().subtract(Duration(days: 30)),
           lastDay: DateTime.now().add(Duration(days: 30)),
         onPageChanged: (data){},

       ),


       SizedBox(height: 22 ,),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=>const TasksItems(), itemCount: 10,))
      
      ],),
    );


  }
}



//EasyDateTimeLinePicker
// firstDate: DateTime.now().subtract(Duration(days: 30)),
// lastDate: DateTime.now().add(Duration(days: 30)),
// focusDate: DateTime.now(),