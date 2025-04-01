import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/feature/auth/data/user_provder.dart';
import 'package:tasks/feature/auth/login/login.dart';
import 'package:tasks/feature/auth/register/register.dart';
import 'package:tasks/feature/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';
import 'package:tasks/feature/list/presebtation/update_tasks.dart';
import 'firebase_options.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create:(_)=>TasksProvider(), ) ,
    ChangeNotifierProvider(create: (_)=>UserProvider()),
  ], child: const Tasks()));

}

class Tasks extends StatelessWidget{
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
       Home.routeName :(context)=>Home(),
       UpdateTasks.routeName :(context)=>UpdateTasks(),
       Login.routeName :(context)=>Login(),
       Register.routeName :(context)=>Register(),
     },initialRoute: Login.routeName,
     theme: AppTheme.light,
     themeMode: ThemeMode.light,
   );
  }
}