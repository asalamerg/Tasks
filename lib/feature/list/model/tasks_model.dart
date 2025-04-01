
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksModel{
  String id ;
  String title ;
  String description ;
  DateTime dateTime ;
  bool isDone ;
  TasksModel({this.id ='',required this.title ,required this.description ,required this.dateTime ,this.isDone=false });

Map<String,dynamic> toJson()=>{
  "id":id ,
  "title":title ,
  "description":description ,
  "dateTime":Timestamp.fromDate(dateTime) ,
  "isDone":isDone ,
};

TasksModel.fromJson(Map<String ,dynamic> json) : this(
  id: json['id'],
  title: json['title'],
  description: json['description'],
  dateTime: (json["dateTime"] as Timestamp).toDate(),
  isDone: json['isDone'],

);


}