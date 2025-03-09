import 'package:flutter/material.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/feature/home/home.dart';

void main() {
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