import 'dart:io';

import 'package:cefops/Src/model/post_model.dart';
import 'package:cefops/Src/repository/PostRepository.dart';
import 'package:cefops/Src/views/SocrePage.dart';
import 'package:cefops/Src/views/editNewsPage.dart';
import 'package:cefops/Src/views/homePage.dart';

import 'package:cefops/Src/views/myCoursePage.dart';
import 'package:cefops/Src/views/widgets/getAlunos.dart';
import 'package:flutter/material.dart';
import '../arequerimentPage.dart';
import '../siginStudantPage.dart';
bool acessgaranted=true;


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<PostModel> futurePost;

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
  int menuColor = 0xff15355C;
  int iconColor = 0xffFD7E14;



  int _selectedIndex = 0;
  String titulos = "Início";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(menuColor),
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

        child: Container(
          color: Color(menuColor),
          child: ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.04 ,),
              Center(child: Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height*0.04 )
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.04 ,),

              ListTile(

                leading: Icon(Icons.home,color:  Color(iconColor),),
                title: Text('Início',style: TextStyle(color: Colors.white),),

                onTap: () {
                  _selectedIndex=0;
                  _onSelectItem(0);
                  titulos = "início";


                },

              ),
              ListTile(
                leading: Icon(Icons.book,color: Color(iconColor),),
                title: Text('Meu Curso',style: TextStyle(color: Colors.white),),
                onTap: () {
      _selectedIndex=1;

                  _onSelectItem(1);
                  titulos = "Meu Curso";
                },
              ),
              ListTile(
                title: Text('Minhas Notas',style: TextStyle(color: Colors.white),),
                leading: Icon(
                  Icons.calendar_view_month,
                  color:   Color(iconColor),),
                  selected: 2 == _selectedIndex,
                onTap: () {

                  _onSelectItem(2);
                  titulos = "Minhas Notas";
                },
              ),
             if(acessgaranted==true) ListTile(
               title: Text('Cadastrar Aluno',style: TextStyle(color: Colors.white),),
               leading: Icon(Icons.person_add,color: Color(iconColor),),
               onTap: () {
                 _selectedIndex=3;
                 _onSelectItem(3);
                 titulos = "Cadastrar Alunos";

               },
             ),
              if(acessgaranted==true) ListTile(
                title: Text('Listar Alunos',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.person_search,color: Color(iconColor),),
                onTap: () {
                  _selectedIndex=4;
                  _onSelectItem(4);
                  titulos = "Listar Alunos";

                },
              ),



              ListTile(
                title: Text('Requerimentos',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.note_add,color: Color(iconColor)),
                selected: 5 == _selectedIndex,
                onTap: () {
                  _onSelectItem(5);

                  titulos = "Requerimentos";

                },
              ),
              ListTile(
                title: Text('Financeiro',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.description,color: Color(iconColor)),
                selected: 5 == _selectedIndex,
                onTap: () {
                  _onSelectItem(5);

                  titulos = "Financeiro";

                },
              ),
              ListTile(
                title: Text('Postagem',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.description,color: Color(iconColor)),
                selected: 6 == _selectedIndex,
                onTap: () {
                  _onSelectItem(6);

                  titulos = "Postagem";

                },
              ),


              ListTile(
                title: Text('Sair',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.exit_to_app,color: Color(iconColor),),

                selected: 7 == _selectedIndex,
                onTap: () {
                  _onSelectItem(7);
                },
              ),
            ],
          ),
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
    );

  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return HomePage() ;
      case 1:
        return myCourse();
      case 2:
        return NotesPage();
      case 3:
        return SiginStudant();
      case 4:
        return GetAlunos();
      case 5:
        return RequeriViews();
      case 6:
        return EditNews();
      case 7:
        return exit(0);

    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.of(context).pop();
  }
}

