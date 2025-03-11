import 'package:flutter/material.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/feature/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( Tasks());
}

class Tasks extends StatelessWidget{
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     routes: {
       Home.routeName :(context)=>Home(),
     },initialRoute: Home.routeName,
     theme: AppTheme.light,
     themeMode: ThemeMode.light,
   );
  }
}