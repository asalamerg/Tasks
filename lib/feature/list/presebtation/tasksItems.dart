import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tasks/feature/list/model/function_firebase.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';

import '../../auth/data/user_provder.dart';
import 'update_tasks.dart';
class TasksItems extends StatelessWidget {
  final TasksModel tasksModel;

  const TasksItems({super.key, required this.tasksModel});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(20),
    
      child: Slidable(
        
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
         //dismissible: DismissiblePane(onDismissed: () {}),
          children:  [
            SlidableAction(
              borderRadius:BorderRadius.circular(30),
              onPressed: (_){
                String userid=Provider.of<UserProvider>(context,listen: false).modelUser!.id;
                FunctionFirebase.deleteTasksFromFirebase(tasksModel.id,userid ).
                timeout(const Duration(microseconds: 100)
                    ,onTimeout:()=>Provider.of<TasksProvider>(context,listen: false).getTasks(userid)


                ).catchError((error){

                  Fluttertoast.showToast(
                      msg: "something wrong",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );


                });
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

            SlidableAction(


              onPressed: (_){
                Navigator.of(context).pushNamed(UpdateTasks.routeName ,arguments: tasksModel);
              },
              borderRadius: BorderRadius.circular(30),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.update,
              label: 'Update',

            ),



          ],
        ),


        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(width: 4, height: 59, color: tasksModel.isDone ? Colors.green :   Colors.blue),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                     Text(
                      tasksModel.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style:  TextStyle(fontSize: 2, fontWeight: FontWeight.bold ,color: tasksModel.isDone ? Colors.green : Colors.blue),
                      ),
                      const SizedBox(height: 5),
                      Text(
                       tasksModel.description,
                        overflow:TextOverflow.ellipsis
                        ,maxLines: 1,
                        style:   TextStyle(fontSize:2 ,  color: tasksModel.isDone ? Colors.green : Colors.blue),
                      ),
                    ],
                  ),
                  const Spacer(),

                  InkWell(
                    onTap: (){
                      FunctionFirebase.updateIsDone(tasksModel, tasksModel.id);
                      FunctionFirebase.getTasksFromFirebase(tasksModel.id);
                    },
                    child: tasksModel.isDone ? const Text("isDone",style: TextStyle(fontSize: 20 , color: Colors.green),)
                        :  Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child:  Icon(Icons.check, size: 20, color: tasksModel.isDone ? Colors.green :  Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

}
