import 'package:application_bibliotheque/generated/l10n.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import '../../const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  User? user = FirebaseAuth.instance.currentUser;
  late bool isAdmin;

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).a17),
        duration: const Duration(
            seconds: 25), // You can adjust the duration as needed
        action: SnackBarAction(
          label: S.of(context).a18, // اخفاء
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<void> uploadUserDataToFirestore(
      User user, Map<String, dynamic> userData) async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Use the user's UID as the document ID
      String uid = user.uid;

      // Upload the user data to Firestore
      await usersCollection.doc(uid).set(userData);
    } catch (e) {
      print('Error uploading user data to Firestore: $e');
    }
  }

  void signUp(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      User? user = FirebaseAuth.instance.currentUser;

      user!.sendEmailVerification();
      showSnackBar(context);
      GoRouter.of(context).push('/loginScreen');
      email.clear();
      password.clear();
      username.clear();
      // Upload User details to Firestore
      Map<String, dynamic> userData = {
        'username': user.displayName,
        'email': user.email,
        'role': 'user', // You can add more user data here
      };
      // Give a role to the user
      giveUsersRole(user);
      uploadUserDataToFirestore(user, userData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        AwesomeDialog(
          context: context,
          dialogBackgroundColor: AppColors.primary,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: S.of(context).a19,
          desc: S.of(context).a20,
          btnCancelOnPress: () {},
          btnCancelText: S.of(context).a21,
        ).show();
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        AwesomeDialog(
          context: context,
          dialogBackgroundColor: AppColors.primary,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: S.of(context).a22,
          desc: S.of(context).a23,
          btnCancelOnPress: () {},
          btnCancelText: S.of(context).a21,
        ).show();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void giveUsersRole(User user) {
    String uid = user.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'role': 'admin',
    });
  }



  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
  }
}
