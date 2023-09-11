import 'package:application_bibliotheque/providers/Auth/signup_provider.dart';
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
  bool? isAdmin;
  //String? userRole;

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
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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

  Future<String> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get the user document from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      // Access the 'role' field from the user document
      final role = userDoc.data()?['role'];
      return role;
    }
    return 'user'; // Default role for unauthenticated users
  }

  Future<String> usersRole() async {
    String role = await getUserRole();
    print("======= userRole is: $role");
    if (role == 'admin') {
      isAdmin = true;
    }
    notifyListeners();
    return role;
  }
  // Fetch and use the user's role

  intData() async {
    await usersRole();
  }
}
