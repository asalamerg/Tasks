
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class TasksItems extends StatelessWidget{
  TasksModel tasksModel ;
   TasksItems({super.key,required this.tasksModel});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2,color: Colors.black),
      ),
      child: Column(

        children: [
          Row(children: [
            Container(width: 4,height: 59,color: Colors.blue,),
            Column(children: [
               SizedBox(width: 20,), Text(tasksModel.title)
              ,  SizedBox(width: 20,), Text(tasksModel.description)
            ],)
            ,const Spacer(),
            Container(width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2,color: Colors.black),

              )

              ,child: const Icon(Icons.check,size: 20,color: Colors.blue,),),],),


        ],
      ),
    );
  }
}