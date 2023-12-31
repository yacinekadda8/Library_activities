import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  // Function to reset the password
  resetPassword(context) async {
    if (formState.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.text,
        );
        // Show a success message or navigate to a success screen
        // You can customize this part based on your app's design
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Password Reset'),
              content: const Text('Password reset link sent to your email.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                     GoRouter.of(context).pushReplacement
                     ('/loginScreen');
                  },
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Handle errors here, e.g., display an error message
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }
  }
    @override
  void dispose() {
    super.dispose();
    email.dispose();
  }
}
