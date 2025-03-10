import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/feature/list/presebtation/add_ShowModel.dart';
import 'package:tasks/feature/list/presebtation/list.dart';
import 'package:tasks/feature/settings/settings.dart';

class Home extends StatefulWidget{
static const   String routeName="home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int select=0;
  List<Widget> items=[
    Lists(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,

        shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          notchMargin: 50,
        padding: EdgeInsets.zero,

        child: BottomNavigationBar(
            elevation: 0,

            type:  BottomNavigationBarType.shifting,
            iconSize: 30,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.blue,
            currentIndex: select,
            onTap: (index){
              select=index;
              setState(() {

              });
            },
            items: [

          BottomNavigationBarItem(icon: Icon(Icons.list),label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
        ]),
      ),
      body: items[select],
      floatingActionButton: FloatingActionButton(

         onPressed: ()=>showModalBottomSheet(context: context ,builder: (context) => AddShoeModel(),),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white ,size: 30, ),
        shape: CircleBorder(side: BorderSide(color: Colors.white ,width: 4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}