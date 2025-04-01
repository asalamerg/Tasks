
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:tasks/core/default_button/def_button.dart';
import 'package:tasks/feature/list/model/function_firebase.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class UpdateTasks extends StatefulWidget{
 static const  String routeName="update";

  const UpdateTasks({super.key});

  @override
  State<UpdateTasks> createState() => _UpdateTasksState();
}

class _UpdateTasksState extends State<UpdateTasks> {
 TextEditingController Title=TextEditingController();

 TextEditingController Details=TextEditingController();

 DateTime selectTime=DateTime.now();

 DateFormat format=DateFormat("dd/MM/yyyy");

 late TasksModel tasksModel;

 @override
  Widget build(BuildContext context) {
      tasksModel=ModalRoute.of(context)!.settings.arguments as TasksModel;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Update Tasks ",style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ),),backgroundColor: Colors.blue,),

      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              width:  double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              margin: const EdgeInsets.symmetric(vertical: 33,horizontal: 33),
              padding: const EdgeInsets.all(15),
              child: Column(
            
                children: [
                const Text("Edit Tasks",style: TextStyle(fontSize: 30 ,),) ,
            
                SizedBox(height: MediaQuery.of(context).size.height *0.15,),
                  const Text("Tasks Title"),
                  TextFormField(
                    initialValue: tasksModel.title,
                  ),
                  const SizedBox(height: 25,),
                  const Text("Tasks Details"),
                  TextFormField( initialValue: tasksModel.description,),
                  const SizedBox(height: 25,),
            
                  const Align( alignment: Alignment.bottomLeft,child: Text("Select Time",style: TextStyle(fontSize: 20),)),
                  const SizedBox(height: 25,),
            
                  InkWell(
                      onTap: () async{
                         DateTime? time=await showDatePicker(
                          context: context ,
                          firstDate: DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now().add(const Duration(days: 30)),
                        );
                         if(time !=null){
                            tasksModel.dateTime=time;
                           setState(() {
            
                           });
                         }
            
            
                      },
                      child: Text(format.format(tasksModel.dateTime),style: const TextStyle(fontSize: 20 ,),)) ,
            
                  const SizedBox(height: 25,),
            
                  defaultButton(title: "Save Changes ",onPressed: ()async{
                   await FunctionFirebase.updateTasksFromFirebase(tasksModel, tasksModel.id).timeout(
                     const Duration(),
                     onTimeout: (){
                       Navigator.of(context).pop();
                       FunctionFirebase.getTasksFromFirebase(tasksModel.id);
                       Fluttertoast.showToast(
                           msg: "Update Tasks ",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.BOTTOM,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.blue,
                           textColor: Colors.white,
                           fontSize: 16.0
                       );
                     }
                   ).catchError((error){
                     Fluttertoast.showToast(
                         msg: "error",
                         toastLength: Toast.LENGTH_SHORT,
                         gravity: ToastGravity.BOTTOM,
                         timeInSecForIosWeb: 1,
                         backgroundColor: Colors.blue,
                         textColor: Colors.white,
                         fontSize: 16.0
                     );
                   });
                  },),
            
            
              ],),
            ),
          ),

        ],
      ),

    );
   }
}

