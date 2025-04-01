import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/feature/auth/data/firebaseFunctionUser.dart';
import 'package:tasks/feature/auth/data/user_provder.dart';
import 'package:tasks/feature/auth/login/login.dart';
import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';

class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings",),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         const Text("Exit",style: TextStyle(fontSize: 30 , ),),
          InkWell(
              onTap: (){
                FunctionFirebaseUser.logout();
                Navigator.of(context).pushReplacementNamed(Login.routeName);
                Provider.of<UserProvider>(context,listen: false).UpdateUser(null);
                Provider.of<TasksProvider>(context,listen: false).tasks.clear();

              },
              child: const Icon(Icons.exit_to_app , size: 30,))
      ],),
    );
  }
}