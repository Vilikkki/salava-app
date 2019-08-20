import 'package:flutter/material.dart';
import 'views/badge_home.dart';
import 'package:salava/classes/tokenStorage.dart';
import 'package:salava/views/login.dart';
import 'package:salava/views/new_home.dart';
import 'package:salava/views/downloaded_badges.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:salava/views/oauth_webview.dart';

void main() async {
  Widget _defaultHome = LoginPage();

  TokenStorage find = new TokenStorage();

  final file = await find.localFile;

  print(file);

  String contents = await file.readAsString();

  bool _result = doIhaveToken(contents);

  //bool _helperBool = false;

  if (_result) {
    _defaultHome = OauthTest();
    //_defaultHome = OauthView();
    //_defaultHome = WelcomeView();
  } else {
    _defaultHome = LoginPage();
  }

  runApp(new MaterialApp(
    title: 'OBP Mobile',
    //home: WelcomeView(),
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      //   Set routes for using the Navigator.
      '/login': (context) => new LoginPage(),
      '/badgeHome': (context) => new BadgeHome(),
      '/downloaded': (context) => new DownloadedBadges(),
      '/welcome': (context) => new WelcomeView(),
    },
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      //const Locale('ar'),
      //const Locale('sv'),
      //const Locale('nl'),
      //const Locale('pt'),
      //const Locale('pl'),
      //const Locale('fi'),
      //const Locale('fr'),
      //const Locale('es'),
      const Locale('en'),
      //const Locale.fromSubtags(
      //   languageCode: 'zh'), // Chinese (mandarin). Dialects can be added with subtags
      // ... other locales the app supports
    ],
  ));
}
