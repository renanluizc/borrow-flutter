import 'package:borrowed_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emprestei?',
      theme: _buildtheme(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
        const Locale('en', 'US'),
      ],
      home: HomePage(),
    );
  }

  _buildtheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff0c0e58),
      accentColor: Colors.red,
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Raleway' 
    );
  }
}
