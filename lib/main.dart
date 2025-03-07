import 'package:flutter/material.dart';
import 'package:tasks/feature/home/home.dart';

void main() {
  runApp( Tasks());
}

class Tasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     routes: {
       Home.routeName :(context)=>Home(),
     },initialRoute: Home.routeName,
   );
  }
}