
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTextForm extends StatelessWidget{
  String hindText ;
  TextEditingController controller ;
  DefaultTextForm({required this.hindText ,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hindText,
        hintStyle: TextStyle(fontSize: 20, )

      ),
      controller: controller,


    );
  }
}