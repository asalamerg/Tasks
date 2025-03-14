
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/feature/list/model/tasks_model.dart';

class FunctionFirebase{

static  CollectionReference<TasksModel> getTasksFromFirebaseCollection() => FirebaseFirestore.instance.collection("Tasks").
withConverter<TasksModel>(
    fromFirestore: (docSnapShot ,_)=>TasksModel.fromJson(docSnapShot.data()!) ,
    toFirestore: (tasks,_)=>tasks.toJson()
    //create collection  content Document
);

  static Future<void> addTasksSentFirebase(TasksModel tasksModel)async{
  CollectionReference<TasksModel>  addTasks =  getTasksFromFirebaseCollection();
   DocumentReference<TasksModel> documentReference = addTasks.doc(); // doc = add id Document
   tasksModel.id=documentReference.id;
   return documentReference.set(tasksModel);

 }

static Future<List<TasksModel>> getTasksFromFirebase()async{
  CollectionReference<TasksModel>  addTasks =  getTasksFromFirebaseCollection();
 QuerySnapshot<TasksModel> querySnapshot = await addTasks.get();
  return querySnapshot.docs.map((docSnapShot)=>docSnapShot.data()).toList();
}

}