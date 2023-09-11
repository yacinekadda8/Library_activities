import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../const.dart';

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  bool isLoading = false;

  contunueAsGust() {}
  // ========================   LOGIN WITH GOOGLE ========================
  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    GoRouter.of(context).pushReplacement('/homeScreen');
  }
  // ========================   LOGIN WITH EMAIL && PASSWORD ========================

  void login(context) async {
    try {
      isLoading = true;
      notifyListeners();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      isLoading = false;
      notifyListeners();
      if (credential.user!.emailVerified) {
        isLoading = false;

        GoRouter.of(context).pushReplacement('/homeScreen');
        email.clear();
        password.clear();
      } else {
        AwesomeDialog(
          context: context,
          dialogBackgroundColor: AppColors.primary,
          dialogType: DialogType.info,
          showCloseIcon: true,
          animType: AnimType.scale,
          title: 'حساب غي مفعل',
          desc:
              'أنت على وشك الوصول! لقد أرسلنا إليك بريدًا إلكترونيًا\n ما عليك سوى النقر على الرابط الموجود في هذا البريد الإلكتروني لإكمال اشتراكك.  \nإذا لم تشاهده فقد تحتاج إلى التحقق من مجلد الرسائل غير المرغوب فيها',
          btnCancelOnPress: () {},
          btnCancelText: 'Try again',
          btnCancelColor: AppColors.secondaryColor,
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
        AwesomeDialog(
          context: context,
          dialogBackgroundColor: AppColors.primary,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'User not found',
          desc: 'No user found for that email.',
          btnCancelOnPress: () {
            GoRouter.of(context).pushReplacement('/loginScreen');
          },
          btnCancelText: 'Try again',
        ).show();
        isLoading = false;
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        AwesomeDialog(
          context: context,
          dialogBackgroundColor: AppColors.primary,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Wrong password',
          desc: 'Wrong password provided for that user.',
          btnCancelOnPress: () {},
          btnCancelText: 'Try again',
        ).show();
      }
      password.clear();
    }
  }
    @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
