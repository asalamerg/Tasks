
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/model/function_firebase.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class TasksProvider with ChangeNotifier{

  List<TasksModel> tasks=[];
  Future<void>    getTasks()async{
    tasks=await FunctionFirebase.getTasksFromFirebase();
    notifyListeners();
  }
}