import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/meuPerfil.dart';
import 'package:cefops/Src/views/teste_navegacao.dart';

import 'home.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      title: 'Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => loginPage(),
        '/home': (context) => HomePage(),
        "/perfil": (context) => PerfilHome(),
        "/notes": (context) => NotesPage(),
        "/test": (context) => MyApp(),
      },
    );
  }
}
