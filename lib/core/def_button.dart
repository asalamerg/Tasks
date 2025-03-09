
import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget{
  String title ;
  void Function()? onPressed ;
  defaultButton({super.key, required this.title , required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed ,style:ElevatedButton.styleFrom(
      backgroundColor: Colors.blue ,
      fixedSize: Size(MediaQuery.of(context).size.width , 50)
    )  ,

      child: Text(title,style: const TextStyle(fontSize: 20 , color: Colors.white ),),
    ) ;

  }
}
