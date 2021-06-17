import 'dart:io';

import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/home.dart';
import 'package:cefops/Src/views/loginPage.dart';
import 'package:cefops/Src/views/myCourse.dart';
import 'package:flutter/material.dart';
import 'arequeriment.dart';
import 'cadastroAlunos.dart';
bool acessgaranted=false;

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
           ! acessgaranted ?
            ListTile(
              title: Text('Requerimentos'),
              leading: Icon(Icons.note_add),
              selected: 3 == _selectedIndex,
              onTap: () {
                _onSelectItem(3);
                titulos = "RequerimentosRRR";

              },
            ):
            ListTile(
              title: Text('Cadastrar Aluno'),
              leading: Icon(Icons.note_add),
              selected: 3 == _selectedIndex,
              onTap: () {
                _onSelectItem(3);
                titulos = "Cadastrar Alunos";

              },
            ),



            ListTile(
              title: Text('Sair'),
              leading: Icon(Icons.exit_to_app),
              selected: 4 == _selectedIndex,
              onTap: () {
                _onSelectItem(4);
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
      case 3:
        return _viwesPermission();
      case 4:
        return exit(0);
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
_viwesPermission(){
  try{
    if(acessgaranted==true){
      return SiginStudant();
    } else{
      return RequeriViews();
    }
  }catch(e){
    return RequeriViews();
  }

}