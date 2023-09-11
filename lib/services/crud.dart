// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  CollectionReference activities = FirebaseFirestore.instance.collection('activities');

  Future<void> addData(actData) async {
    activities.add(actData);
  }

  Future getData() async {
    return await activities.get();
  }

Future<void> deleteData(uId) {
  return activities
    .doc(uId)
    .delete()
    .then((value) => print("Item Deleted"))
    .catchError((error) => print("Failed to delete Item: $error"));
}
}
