import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tasks/core/default_button/def_button.dart';
import 'package:tasks/core/text_form/text_form_filde.dart';
import 'package:tasks/core/validator/validator.dart';
import 'package:tasks/feature/auth/data/user_provder.dart';
import 'package:tasks/feature/list/model/function_firebase.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';
import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddShoeModel extends StatefulWidget{
  const AddShoeModel({super.key});

  @override
  State<AddShoeModel> createState() => _AddShoeModelState();
}

class _AddShoeModelState extends State<AddShoeModel> {
  TextEditingController  Title=TextEditingController();
  TextEditingController  Description=TextEditingController();
 DateFormat selectFormat=DateFormat("dd-MM-yyyy");
  DateTime selectDataTime=DateTime.now();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key:formKey ,
      child: Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ),

        child: Container(
          height: MediaQuery.of(context).size.height *0.5,
           padding:   const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text("Add New Tasks ",style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height:10 ,),
              DefaultTextForm(hindText: "Enter Tasks Title", controller:Title, validator:Validators.TitleValidator),
              const SizedBox(height:10 ,),
              DefaultTextForm(hindText: "Enter Tasks Description", controller:Description,validator: Validators.TitleValidator),
              const SizedBox(height:10 ,),
              const Align(alignment: Alignment.bottomLeft, child: Text("Select Data",style: TextStyle(fontSize: 20),)),
              InkWell(
                  onTap: ()  async{
                   DateTime? dateTime =await showDatePicker (
                      context: context ,
                      firstDate: DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                      initialDate: selectDataTime,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                   );
                   if(dateTime !=null){selectDataTime=dateTime;}
                   setState(() {

                   });
                   },

                  child: Text(selectFormat.format(selectDataTime),style: const TextStyle(fontSize: 20),)),
              const SizedBox(height:10 ,),

              defaultButton(onPressed: AddTasks,title: "Add ",),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> AddTasks()async{
    if (formKey.currentState!.validate()) {
     TasksModel tasksModel=TasksModel(
         title: Title.toString(),
         description: Description.toString(),
         dateTime: selectDataTime,



     );
     String userid=Provider.of<UserProvider>(context,listen: false).modelUser!.id;
     await  FunctionFirebase.addTasksSentFirebase(tasksModel,userid )
         .timeout(
       const Duration(microseconds: 200),
       onTimeout: (){Navigator.of(context).pop();
       Provider.of<TasksProvider>(context , listen:  false).getTasks(userid);
       Fluttertoast.showToast(
           msg: "Added Tasks success full",
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
           msg: "something wrong",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );

     });
    }

  }
}