
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';
import 'package:tasks/feature/list/presebtation/tasksItems.dart';
import 'package:table_calendar/table_calendar.dart';
class Lists extends StatefulWidget{
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {

   bool isTasks=true;
  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider =Provider.of(context);

    if(isTasks){
      tasksProvider.getTasks();
      isTasks=false;
    }

    return  SafeArea(
      child: Column(children: [
       TableCalendar(
           focusedDay:  DateTime.now(),
           firstDay: DateTime.now().subtract(const Duration(days: 30)),
           lastDay: DateTime.now().add(const Duration(days: 30)),
         onPageChanged: (data){},

       ),


       const SizedBox(height: 22 ,),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=> TasksItems(tasksModel:tasksProvider.tasks[index],), itemCount: tasksProvider.tasks.length,))

      ],),
    );


  }

  // Future<void> getTasks()async{
  //    tasks=await FunctionFirebase.getTasksFromFirebase();
  //    setState(() {
  //
  //    });
  // }

// List<TasksModel> tasks=[];
//List.generate(10, (index)=>TasksModel(title: "title $index ", description: "description $index", dateTime: DateTime.now()));
}

