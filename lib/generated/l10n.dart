// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Connexion`
  String get a {
    return Intl.message(
      'Connexion',
      name: 'a',
      desc: '',
      args: [],
    );
  }

  /// `Connectez-vous pour continuer à utiliser l'application`
  String get b {
    return Intl.message(
      'Connectez-vous pour continuer à utiliser l\'application',
      name: 'b',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get c {
    return Intl.message(
      'Email',
      name: 'c',
      desc: '',
      args: [],
    );
  }

  /// `Entrez votre adresse e-mail`
  String get d {
    return Intl.message(
      'Entrez votre adresse e-mail',
      name: 'd',
      desc: '',
      args: [],
    );
  }

  /// `Ne peut pas être vide`
  String get e {
    return Intl.message(
      'Ne peut pas être vide',
      name: 'e',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe`
  String get f {
    return Intl.message(
      'Mot de passe',
      name: 'f',
      desc: '',
      args: [],
    );
  }

  /// `Entrez votre mot de passe`
  String get g {
    return Intl.message(
      'Entrez votre mot de passe',
      name: 'g',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe oublié ?`
  String get h {
    return Intl.message(
      'Mot de passe oublié ?',
      name: 'h',
      desc: '',
      args: [],
    );
  }

  /// `Connexion`
  String get k {
    return Intl.message(
      'Connexion',
      name: 'k',
      desc: '',
      args: [],
    );
  }

  /// `Connexion avec Google`
  String get z {
    return Intl.message(
      'Connexion avec Google',
      name: 'z',
      desc: '',
      args: [],
    );
  }

  /// `Continuer en tant qu'invité`
  String get x {
    return Intl.message(
      'Continuer en tant qu\'invité',
      name: 'x',
      desc: '',
      args: [],
    );
  }

  /// `Vous n'avez pas de compte ?`
  String get n {
    return Intl.message(
      'Vous n\'avez pas de compte ?',
      name: 'n',
      desc: '',
      args: [],
    );
  }

  /// `S'inscrire`
  String get v {
    return Intl.message(
      'S\'inscrire',
      name: 'v',
      desc: '',
      args: [],
    );
  }

  /// `Inscrivez-vous pour continuer à utiliser l'application`
  String get a0 {
    return Intl.message(
      'Inscrivez-vous pour continuer à utiliser l\'application',
      name: 'a0',
      desc: '',
      args: [],
    );
  }

  /// `Nom d'utilisateur`
  String get a1 {
    return Intl.message(
      'Nom d\'utilisateur',
      name: 'a1',
      desc: '',
      args: [],
    );
  }

  /// `Entrez votre nom d'utilisateur`
  String get a2 {
    return Intl.message(
      'Entrez votre nom d\'utilisateur',
      name: 'a2',
      desc: '',
      args: [],
    );
  }

  /// `S'inscrire`
  String get a3 {
    return Intl.message(
      'S\'inscrire',
      name: 'a3',
      desc: '',
      args: [],
    );
  }

  /// `Ne peut pas être inférieur à 3 caractères`
  String get a4 {
    return Intl.message(
      'Ne peut pas être inférieur à 3 caractères',
      name: 'a4',
      desc: '',
      args: [],
    );
  }

  /// `Erreur`
  String get a5 {
    return Intl.message(
      'Erreur',
      name: 'a5',
      desc: '',
      args: [],
    );
  }

  /// `Requête non valide`
  String get a6 {
    return Intl.message(
      'Requête non valide',
      name: 'a6',
      desc: '',
      args: [],
    );
  }

  /// `Réessayez`
  String get a7 {
    return Intl.message(
      'Réessayez',
      name: 'a7',
      desc: '',
      args: [],
    );
  }

  /// `Vous avez déjà un compte ?`
  String get a8 {
    return Intl.message(
      'Vous avez déjà un compte ?',
      name: 'a8',
      desc: '',
      args: [],
    );
  }

  /// `Réinitialiser le mot de passe`
  String get a9 {
    return Intl.message(
      'Réinitialiser le mot de passe',
      name: 'a9',
      desc: '',
      args: [],
    );
  }

  /// `Entrez l'adresse e-mail associée à votre compte, et nous vous enverrons un lien pour réinitialiser votre mot de passe.`
  String get a10 {
    return Intl.message(
      'Entrez l\'adresse e-mail associée à votre compte, et nous vous enverrons un lien pour réinitialiser votre mot de passe.',
      name: 'a10',
      desc: '',
      args: [],
    );
  }

  /// `Entrez votre adresse e-mail`
  String get a11 {
    return Intl.message(
      'Entrez votre adresse e-mail',
      name: 'a11',
      desc: '',
      args: [],
    );
  }

  /// `Veuillez entrer une adresse e-mail valide`
  String get a12 {
    return Intl.message(
      'Veuillez entrer une adresse e-mail valide',
      name: 'a12',
      desc: '',
      args: [],
    );
  }

  /// `Envoyer le lien`
  String get a13 {
    return Intl.message(
      'Envoyer le lien',
      name: 'a13',
      desc: '',
      args: [],
    );
  }

  /// `Veuillez entrer une adresse e-mail valide`
  String get a14 {
    return Intl.message(
      'Veuillez entrer une adresse e-mail valide',
      name: 'a14',
      desc: '',
      args: [],
    );
  }

  /// `Vous n'avez pas de compte ?`
  String get a15 {
    return Intl.message(
      'Vous n\'avez pas de compte ?',
      name: 'a15',
      desc: '',
      args: [],
    );
  }

  /// `S'inscrire`
  String get a16 {
    return Intl.message(
      'S\'inscrire',
      name: 'a16',
      desc: '',
      args: [],
    );
  }

  /// `Vous êtes sur le point d'accéder ! Nous vous avons envoyé un e-mail. Cliquez simplement sur le lien dans cet e-mail pour finaliser votre inscription. Si vous ne le voyez pas, vérifiez votre dossier de courrier indésirable.`
  String get a17 {
    return Intl.message(
      'Vous êtes sur le point d\'accéder ! Nous vous avons envoyé un e-mail. Cliquez simplement sur le lien dans cet e-mail pour finaliser votre inscription. Si vous ne le voyez pas, vérifiez votre dossier de courrier indésirable.',
      name: 'a17',
      desc: '',
      args: [],
    );
  }

  /// `Masquer`
  String get a18 {
    return Intl.message(
      'Masquer',
      name: 'a18',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe faible`
  String get a19 {
    return Intl.message(
      'Mot de passe faible',
      name: 'a19',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe fourni est trop faible.`
  String get a20 {
    return Intl.message(
      'Le mot de passe fourni est trop faible.',
      name: 'a20',
      desc: '',
      args: [],
    );
  }

  /// `Réessayez`
  String get a21 {
    return Intl.message(
      'Réessayez',
      name: 'a21',
      desc: '',
      args: [],
    );
  }

  /// `Adresse e-mail déjà utilisée`
  String get a22 {
    return Intl.message(
      'Adresse e-mail déjà utilisée',
      name: 'a22',
      desc: '',
      args: [],
    );
  }

  /// `Un compte existe déjà pour cette adresse e-mail.`
  String get a23 {
    return Intl.message(
      'Un compte existe déjà pour cette adresse e-mail.',
      name: 'a23',
      desc: '',
      args: [],
    );
  }

  /// `Accueil`
  String get a24 {
    return Intl.message(
      'Accueil',
      name: 'a24',
      desc: '',
      args: [],
    );
  }

  /// `Ajouter une catégorie`
  String get a25 {
    return Intl.message(
      'Ajouter une catégorie',
      name: 'a25',
      desc: '',
      args: [],
    );
  }

  /// `Nom de la catégorie`
  String get a26 {
    return Intl.message(
      'Nom de la catégorie',
      name: 'a26',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
