
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class FunctionFirebase{

static  CollectionReference<TasksModel> getTasksFromFirebaseCollection() =>
    FirebaseFirestore.instance.collection("Tasks").
withConverter<TasksModel>(
    fromFirestore: (docSnapShot ,_)=>TasksModel.fromJson(docSnapShot.data()!) ,
    toFirestore: (tasks,_)=>tasks.toJson()
    //create collection  content Document
);

  static Future<void> addTasksSentFirebase(TasksModel tasksModel)async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection();
   DocumentReference<TasksModel> documentReference = getTasks.doc(); // doc = add id Document
   tasksModel.id=documentReference.id;
   return documentReference.set(tasksModel);

 }

static Future<List<TasksModel>> getTasksFromFirebase()async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection();
 QuerySnapshot<TasksModel> querySnapshot = await getTasks.get();
  return querySnapshot.docs.map((docSnapShot)=>docSnapShot.data()).toList();
}

static Future<void> deleteTasksFromFirebase(String id)async{
  CollectionReference<TasksModel>  getTasks =  getTasksFromFirebaseCollection();
 return  getTasks.doc(id).delete();
}
static Future<void> updateTasksFromFirebase(TasksModel tasksModel)async{
      CollectionReference<TasksModel>   getTasks=  getTasksFromFirebaseCollection();
      DocumentReference<TasksModel>  updateTasks= getTasks.doc(tasksModel.id);
    await  updateTasks.update(tasksModel.toJson());


    }

static Future<void>  updateIsDone(TasksModel tasksModel)async{
      CollectionReference<TasksModel>   getTasks=  getTasksFromFirebaseCollection();
      DocumentReference<TasksModel>  updateTasks= getTasks.doc(tasksModel.id);
     await  updateTasks.update({"isDone" : !tasksModel.isDone});


    }
}