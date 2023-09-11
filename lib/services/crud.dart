// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(actData) async {
    FirebaseFirestore.instance.collection("activities").add(actData);
  }

  Future getData() async {
    return await FirebaseFirestore.instance
        .collection("activities")
        .get();
  }
}
