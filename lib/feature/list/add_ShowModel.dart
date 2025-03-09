import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks/core/def_button.dart';
import 'package:tasks/core/text_form/text_form_filde.dart';

class AddShoeModel extends StatefulWidget{
  @override
  State<AddShoeModel> createState() => _AddShoeModelState();
}

class _AddShoeModelState extends State<AddShoeModel> {
  TextEditingController  Title=TextEditingController();
  TextEditingController  Description=TextEditingController();
 DateFormat selectFormat=DateFormat("dd-MM-yyyy");
  DateTime selectDataTime=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text("Add New Tasks ",style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height:10 ,),
            DefaultTextForm(hindText: "Enter Tasks Title", controller:Title,),
            SizedBox(height:10 ,),
            DefaultTextForm(hindText: "Enter Tasks Description", controller:Description,),
            SizedBox(height:10 ,),
            Align(alignment: Alignment.bottomLeft, child: Text("Select Data",style: TextStyle(fontSize: 20),)),
            InkWell(
                onTap: ()  async{
                 DateTime? dateTime =await showDatePicker (
                    context: context ,
                    firstDate: DateTime.now().subtract(Duration(days: 30)),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                    initialDate: selectDataTime,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                 );
                 if(dateTime !=null){selectDataTime=dateTime;}
                 setState(() {

                 });
                 },

                child: Text(selectFormat.format(selectDataTime),style: TextStyle(fontSize: 20),)),
            SizedBox(height:10 ,),
            defaultButton(onPressed: (){},title: "Add ",),

          ],
        ),
      ),
    );
  }
}