import 'package:application_bibliotheque/providers/Auth/signup_provider.dart';
import 'package:application_bibliotheque/services/crud.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../const.dart';
import '../../view/widgets/home/activity_tile.dart';
import '../../view/widgets/home/home_screen_body.dart';

class HomeController extends ChangeNotifier {
  CrudMethods crudMethods = CrudMethods();
  final List<QueryDocumentSnapshot> data = [];
  late QuerySnapshot activitySnapshot;
  bool isloading = false;
  bool? isAdmin;
  //String? userRole;

  fetchActivities() async {
    data.clear();
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

  deleteActivities(uId) {
    crudMethods.deleteData(uId);
    fetchActivities();
  }
    void deleteWithWarning(BuildContext context, QueryDocumentSnapshot<Object?> data) {
    AwesomeDialog(
        context: context,
        dialogBackgroundColor: kblue,
        dialogType: DialogType.warning,
        showCloseIcon: true,
        animType: AnimType.scale,
        title: 'remove',
        desc: 'remove the activity',
        btnCancelOnPress: () {},
        btnCancelText: 'cancel',
        btnCancelColor: kpurple,
        btnOkColor: kdark,
        btnOkOnPress: () {
          deleteActivities(data.id);
        }).show();
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
