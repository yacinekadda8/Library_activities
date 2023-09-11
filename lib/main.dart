import 'package:application_bibliotheque/const.dart';
import 'package:application_bibliotheque/providers/Auth/login_provider.dart';
import 'package:application_bibliotheque/providers/Auth/reset_password_provider.dart';
import 'package:application_bibliotheque/providers/Auth/signup_provider.dart';
import 'package:application_bibliotheque/providers/create_activity_provider.dart';
import 'package:application_bibliotheque/providers/home_provider.dart';
import 'package:application_bibliotheque/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:application_bibliotheque/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeController()),
    ChangeNotifierProvider(create: (_) => LoginController()),
    ChangeNotifierProvider(create: (_) => SignupController()),
    ChangeNotifierProvider(create: (_) => ResetPasswordController()),
    ChangeNotifierProvider(create: (_) => CreateActivityProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    userState(); // login or logout
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('fr'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Bibliotheque App',
      theme: ThemeData(
        scaffoldBackgroundColor: kneutralColor,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all<Color>(kgreyColor),
                )),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kprimaryColor,
        ),
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

void userState() {
  FirebaseAuth.instance.authStateChanges().listen(
    (User? user) {
      if (user == null) {
        print('---- User is currently signed out! ----');
      } else {
        print('---- User is signed in! ----');
      }
    },
  );
}
