
class TasksModel{
  String id ;
  String title ;
  String description ;
  DateTime dateTime ;
  bool isDone ;
  TasksModel({this.id ='',required this.title ,required this.description ,required this.dateTime ,this.isDone=false });
}