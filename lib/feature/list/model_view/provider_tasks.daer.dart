
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/model/function_firebase.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class TasksProvider with ChangeNotifier{

  List<TasksModel> tasks=[];
  Future<void>    getTasks(String userId)async{
    tasks=await FunctionFirebase.getTasksFromFirebase(userId);
    tasks=tasks.where((task)=>
        task.dateTime.year ==selectDateTime.year &&
        task.dateTime.month ==selectDateTime.month &&
        task.dateTime.day ==selectDateTime.day ).toList();
    notifyListeners();
  }

  DateTime selectDateTime=DateTime.now();

   void ChangeDateTime(DateTime date, String userId){
     selectDateTime=date ;
      getTasks(userId);
         notifyListeners();
  }


}