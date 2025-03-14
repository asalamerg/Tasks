import 'package:flutter/material.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class TasksItems extends StatelessWidget {
  final TasksModel tasksModel;

  const TasksItems({super.key, required this.tasksModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(width: 4, height: 59, color: Colors.blue),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  tasksModel.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 2, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                   tasksModel.description,
                    overflow:TextOverflow.ellipsis
                    ,maxLines: 1,
                    style: const TextStyle(fontSize: 2, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: const Icon(Icons.check, size: 20, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );

  }

}
