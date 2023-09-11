import 'package:application_bibliotheque/const.dart';
import 'package:application_bibliotheque/providers/Auth/reset_password_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';
import '../../widgets/custombuttonauth.dart';
import '../../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResetPasswordController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: provider.formState,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                S.of(context).a10,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              CustomTextForm(
                hinttext: S.of(context).a11,
                mycontroller: provider.email,
                validator: (val) {
                  if (val!.isEmpty || !val.contains('@')) {
                    return S.of(context).a14;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButtonAuth(
                onPressed: () async {
                  provider.resetPassword(context);
                },
                title: S.of(context).a13,
                color: Colors.amber,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).a15,
                    style: const TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                              GoRouter.of(context).pushReplacement('/loginScreen');

                    },
                    child: Text(
                      S.of(context).a16,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
