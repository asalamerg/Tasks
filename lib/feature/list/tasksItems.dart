
import 'package:flutter/material.dart';

class TasksItems extends StatelessWidget{
  const TasksItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2,color: Colors.black),
      ),
      child: Column(

        children: [
          Row(children: [Container(width: 4,height: 59,color: Colors.blue,),const SizedBox(width: 20,),const Text(" hi ")
            ,const Spacer(),
            Container(width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2,color: Colors.black),

              )

              ,child: const Icon(Icons.check,size: 20,color: Colors.blue,),),],),
          const SizedBox(height: 10,),
          const Align(alignment: Alignment.bottomLeft,child: Text("3/8/2025")),
        ],
      ),
    );
  }
}