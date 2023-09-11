import 'package:application_bibliotheque/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/widgets/home/activity_tile.dart';
import '../view/widgets/home/home_screen_body.dart';

class HomeController extends ChangeNotifier {
  CrudMethods crudMethods = CrudMethods();
  final List<QueryDocumentSnapshot> data = [];
  late QuerySnapshot activitySnapshot;
  bool isloading = false;

  fetchCategories() async {
    try {
      isloading = true;
      data.clear();
      activitySnapshot = await crudMethods.getData();
      data.addAll(activitySnapshot.docs);
      //await Future.delayed(const Duration(seconds: 2));
      print(data);
      isloading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
      // Handle the error, e.g., show an error message to the user
    }
  }

  Widget activitiesList() {
    return Container(
        child: isloading == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // var data = snapshot!.docs[index].data()
                  //     as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ActivityTile(
                      imgUrl: data[index]['imageUrl'],
                      title: data[index]['activiteTitle'],
                      body: data[index]['activiteDescription'],
                      author: data[index]['activiteAuthor'],
                    ),
                  );
                }));
  }

  void logout(context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    //Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    GoRouter.of(context).pushReplacement('/loginScreen');
  }
}
