// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:application_bibliotheque/providers/Auth/login_provider.dart';
import 'package:application_bibliotheque/view/widgets/custombuttonauth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../const.dart';
import '../../../generated/l10n.dart';
import '../../widgets/circular_loading.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/customlogoauth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context);
    return Scaffold(
      //backgroundColor: AppColors.bg,
      body: provider.isLoading
          ? const CircularLoading()
          : Container(
              padding: const EdgeInsets.all(20),
              child: ListView(children: [
                Form(
                  key: provider.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  const SizedBox(height: 20),
                      const CustomLogoAuth(),
                      const SizedBox(height: 20),
                      Text(S.of(context).a,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(S.of(context).b,
                          style: TextStyle(
                            color: kdark.withOpacity(.6),
                          )),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).c,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).f,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
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
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push('/resetPasswordScreen');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          alignment: Alignment.topRight,
                          child: Text(
                            S.of(context).h,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButtonAuth(
                    title: S.of(context).k,
                    color: kdark.withOpacity(.5),
                    onPressed: () async {
                      if (provider.formState.currentState!.validate()) {
                        provider.login(context);
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogBackgroundColor: kblue,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: S.of(context).a5,
                          desc: S.of(context).a6,
                          btnCancelOnPress: () {},
                          btnCancelText: S.of(context).a7,
                        ).show();
                      }
                    }),
                Container(height: 20),

                MaterialButton(
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kblue,
                    textColor: Colors.white,
                    onPressed: () {
                      provider.signInWithGoogle(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).z),
                        Image.asset(
                          "assets/images/google.png",
                          width: 20,
                        )
                      ],
                    )),

                Container(height: 20),
                CustomButtonAuth(
                    title: S.of(context).x, //Continue As Guest
                    color: kblue.withOpacity(.5),
                    onPressed: () {
                      GoRouter.of(context).push('/homeScreen');
                    }),
                Container(height: 20),
                // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/signUpScreen');
                  },
                  child: Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: S.of(context).n,
                      ),
                      TextSpan(
                          text: S.of(context).v, //Register
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
