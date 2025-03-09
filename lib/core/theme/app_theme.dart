
import 'package:flutter/material.dart';

class AppTheme {
static const  Color backgroundLight=Color(0XFFDFECDB);
static const  Color primaryLight=Color(0XFF5D9CEC);
static const  Color backgroundDark=Color(0xff060E1E);
static const  Color primaryDark=Color(0xff5D9CEC);
static const  Color green=Color(0XFF61E757);
static const  Color rad=Color(0XFFEC4B4B);
static const  Color grey=Color(0XFFC8C9CB);

 static ThemeData light =ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
 scaffoldBackgroundColor: const Color(0XFFDFECDB),
  textTheme: TextTheme(headlineLarge: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold))

 );

static ThemeData dark=ThemeData(
 scaffoldBackgroundColor: const Color(0xff060E1E),

);
}