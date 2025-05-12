import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/course_model.dart';

class DatabaseService {
  final CollectionReference blogsCollection = FirebaseFirestore.instance.collection('blogs');

  List<Course> _fromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((DocumentSnapshot document) {
      return Course.fromJson(document.data()! as Map<String, dynamic>);
    }).toList();
  }

  Stream<List<Course>> get fetchCourses {
      return blogsCollection.snapshots().map(_fromSnapshot);
  }

  // // added to test the db connection
  // Future insertDocument() async {
  //   return await blogsCollection.add({
  //     "id": "Asdsad",
  //     "name": "Asdsa"
  //   });
  // }
}