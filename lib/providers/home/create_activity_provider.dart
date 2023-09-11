import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/crud.dart';

class CreateActivityProvider extends ChangeNotifier {
  late String title, body, author;
  XFile? selectedImage;
  CrudMethods crudMethods = CrudMethods();
  Timestamp timestamp = Timestamp.fromDate(DateTime.now());

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    selectedImage = image!;
    notifyListeners();
  }

  uploadActivities(context) async {
    // ========================   upload images to FirebaseStorage
    if (selectedImage != null) {
      //----
      File imageFile = File(selectedImage!.path);
      try {
        final Reference storageReference = FirebaseStorage.instance
            .ref()
            .child("activitiesImages")
            .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
        final UploadTask uploadTask = storageReference.putFile(imageFile);
        final TaskSnapshot taskSnapshot = await uploadTask;
        final imageUrl = await storageReference.getDownloadURL();
        // You can now use 'url' to display or further process the uploaded image.
        print('Image URL: $imageUrl');
        Map<String, dynamic> activitiesMap = {
          "imageUrl": imageUrl,
          "activiteTitle": title,
          "activiteDescription": body,
          "activiteAuthor": author,
          "activitePublishDate": timestamp,
        };
        crudMethods.addData(activitiesMap).then((result) {
          GoRouter.of(context).pushReplacement('/homeScreen');
        });
      } catch (e) {
        print('Error during uploading $e');
      }
    } else {}
  }
}
