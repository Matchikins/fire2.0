import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/home.dart';
import 'package:cefops/Src/views/myCourse.dart';
import 'package:flutter/material.dart';

import 'fragment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEFOPS DIGITAL',
      home: MyHomePage(title: 'CEFOPS DIGITAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int iconColor = 0xff15355C;
  int _selectedIndex = 0;
  String titulos = "Inicio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(iconColor),
        title: Center(
          child: new Text(
            titulos,
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Center(
            child: Image.asset("assets/images/Logo_Digital.png"),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              selected: 0 == _selectedIndex,
              onTap: () {
                _onSelectItem(0);
                titulos = "início";
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Meu Curso'),
              selected: 1 == _selectedIndex,
              onTap: () {
                _onSelectItem(1);
                titulos = "Meu Curso";
              },
            ),
            ListTile(
              title: Text('Minhas Notas'),
              leading: Icon(Icons.calendar_view_month),
              selected: 2 == _selectedIndex,
              onTap: () {
                _onSelectItem(2);
                titulos = "Minhas Notas";
              },
            ),
            ListTile(
              title: Text('Sair'),
              leading: Icon(Icons.exit_to_app),
              selected: 3 == _selectedIndex,
              onTap: () {
                _onSelectItem(3);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return HomePage();
      case 1:
        return myCourse();
      case 2:
        return NotesPage();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }
}

Mydrawer(String text, int _selectedIndex, IconData? icons, ontap) {
  return ListTile(
    leading: Icon(Icons.home),
    title: Text(text),
    selected: _selectedIndex == _selectedIndex,
    onTap: ontap(),
  );
}
