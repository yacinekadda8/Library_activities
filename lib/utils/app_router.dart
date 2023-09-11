import 'package:application_bibliotheque/view/screens/auth/login_screen.dart';
import 'package:application_bibliotheque/view/screens/auth/reset_password_screen.dart';
import 'package:application_bibliotheque/view/screens/auth/signup_screen.dart';
import 'package:application_bibliotheque/view/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../view/screens/create_activity.dart';
import '../view/screens/home_screen.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified
              ? const HomeScreen()
              : const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'loginScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'homeScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: 'signUpScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpScreen();
            },
          ),
          GoRoute(
            path: 'resetPasswordScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const ResetPasswordScreen();
            },
          ),
          GoRoute(
            path: 'createActivity',
            builder: (BuildContext context, GoRouterState state) {
              return const CreateActivity();
            },
          ),
        ],
      ),
    ],
  );
}
