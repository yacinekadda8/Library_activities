import 'package:application_bibliotheque/generated/l10n.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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

  void signUp(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      showSnackBar(context);
      GoRouter.of(context).push('/loginScreen');
      email.clear();
      password.clear();
      username.clear();
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
}
