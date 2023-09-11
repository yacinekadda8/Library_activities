// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:application_bibliotheque/const.dart';
import 'package:application_bibliotheque/providers/Auth/signup_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/custombuttonauth.dart';
import '../../widgets/customlogoauth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupController>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Form(
            key: provider.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                const CustomLogoAuth(),
                Container(height: 20),
                Text(S.of(context).v,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                Container(height: 10),
                Text(S.of(context).a0,
                    style: TextStyle(color: kdark.withOpacity(.66))),
                Container(height: 20),
                Text(
                  S.of(context).a1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  hinttext: S.of(context).a2,
                  mycontroller: provider.username,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return S.of(context).e;
                    } else if (val.length < 3) {
                      return S.of(context).a4;
                    }
                    return null;
                  },
                ),
                Container(height: 10),
                Text(
                  S.of(context).c,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  hinttext: S.of(context).d,
                  mycontroller: provider.email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return S.of(context).e;
                    }
                    return null;
                  },
                ),
                Container(height: 10),
                Text(
                  S.of(context).f,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  hinttext: S.of(context).g,
                  mycontroller: provider.password,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return S.of(context).e;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomButtonAuth(
            title: S.of(context).a3,
            color: kblue,
            onPressed: () async {
              if (provider.formState.currentState!.validate()) {
                provider.signUp(context);
              } else {
                AwesomeDialog(
                  context: context,
                  dialogBackgroundColor: kdark,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: S.of(context).a5,
                  desc: S.of(context).a6,
                  btnCancelOnPress: () {},
                  btnCancelText: S.of(context).a7,
                ).show();
              }
            },
          ),
          const SizedBox(height: 10),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () => context.go('/loginScreen'),
            child: Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: S.of(context).a8,
                ),
                TextSpan(
                    text: S.of(context).a,
                    style: const TextStyle(
                        color: kdark, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
