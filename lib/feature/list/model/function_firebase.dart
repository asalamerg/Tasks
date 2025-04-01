
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

import '../../auth/data/firebaseFunctionUser.dart';

class FunctionFirebase{

static  CollectionReference<TasksModel> getTasksFromFirebaseCollection(String userId) =>
    FunctionFirebaseUser.getCollectionUser().doc(userId).collection("Tasks").
   withConverter<TasksModel>(
    fromFirestore: (docSnapShot ,_)=>TasksModel.fromJson(docSnapShot.data()!) ,
    toFirestore: (tasks,_)=>tasks.toJson()
    //create collection  content Document
);

  static Future<void> addTasksSentFirebase(TasksModel tasksModel, String userId)async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection(userId);
   DocumentReference<TasksModel> documentReference = getTasks.doc(); // doc = add id Document
   tasksModel.id=documentReference.id;
   return documentReference.set(tasksModel);

 }

static Future<List<TasksModel>> getTasksFromFirebase(String userId)async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection(userId);
 QuerySnapshot<TasksModel> querySnapshot = await getTasks.get();
  return querySnapshot.docs.map((docSnapShot)=>docSnapShot.data()).toList();
}

static Future<void> deleteTasksFromFirebase(String id , String userId)async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection(userId);
 return  getTasks.doc(id).delete();
}
static Future<void> updateTasksFromFirebase(TasksModel tasksModel, String userId)async{
      CollectionReference<TasksModel>   getTasks=  getTasksFromFirebaseCollection(userId);
      DocumentReference<TasksModel>  updateTasks= getTasks.doc(tasksModel.id);
    await  updateTasks.update(tasksModel.toJson());


    }

static Future<void>  updateIsDone(TasksModel tasksModel, String userId)async{
      CollectionReference<TasksModel>   getTasks=  getTasksFromFirebaseCollection(userId);
      DocumentReference<TasksModel>  updateTasks= getTasks.doc(tasksModel.id);
     await  updateTasks.update({"isDone" : !tasksModel.isDone});


    }
}