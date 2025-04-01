
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/feature/auth/data/user_provder.dart';

import 'package:tasks/feature/list/model_view/provider_tasks.daer.dart';
import 'package:tasks/feature/list/presebtation/tasksItems.dart';
import 'package:table_calendar/table_calendar.dart';
class Lists extends StatefulWidget{
  const Lists({super.key});

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {

   bool isTasks=true;
  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider =Provider.of(context);
    UserProvider  userProvider =Provider.of(context, listen: false);

    if(isTasks){
      tasksProvider.getTasks(userProvider.modelUser!.id);
      isTasks=false;
    }

    return  SafeArea(
      child: Column(children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.now().subtract(const Duration(days: 30)),
          lastDay: DateTime.now().add(const Duration(days: 30)),

          // 📌 تحديد اليوم المختار
          selectedDayPredicate: (day) {
            return isSameDay(tasksProvider.selectDateTime, day);
          },

          // 🎨 تخصيص مظهر الجدول
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue, // لون اليوم الحالي
              shape: BoxShape.circle, // شكل دائري
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.green, // لون اليوم المحدد
              shape: BoxShape.circle,
            ),
            weekendTextStyle: TextStyle(color: Colors.red), // لون مخصص لعطلة نهاية الأسبوع
            defaultTextStyle: TextStyle(fontSize: 16), // خط النص الافتراضي
          ),

          // 📅 تنسيق عناوين الأيام (الأحد - الإثنين ...)
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            weekendStyle: TextStyle(color: Colors.red),
          ),

          // 📅 تنسيق شريط الأشهر
          headerStyle: const HeaderStyle(
            formatButtonVisible: false, // إخفاء زر تغيير التنسيق
            titleCentered: true, // جعل العنوان في المنتصف
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.blue),
            rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ),

          // 📌 تحديد اليوم
          onDaySelected: (selectedDay, focusedDay) {
            tasksProvider.ChangeDateTime(selectedDay , userProvider.modelUser!.id);
          },
        ),


       const SizedBox(height: 22 ,),
        Expanded(child: ListView.builder(itemBuilder: (context,index)=> TasksItems(tasksModel:tasksProvider.tasks[index],), itemCount: tasksProvider.tasks.length,))

      ],),
    );


  }

  // Future<void> getTasks()async{
  //    tasks=await FunctionFirebase.getTasksFromFirebase();
  //    setState(() {
  //
  //    });
  // }

// List<TasksModel> tasks=[];
//List.generate(10, (index)=>TasksModel(title: "title $index ", description: "description $index", dateTime: DateTime.now()));
}

