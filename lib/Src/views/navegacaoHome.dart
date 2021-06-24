import 'dart:io';

import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/homePage.dart';

import 'package:cefops/Src/views/myCourse.dart';
import 'package:flutter/material.dart';
import 'arequeriment.dart';
import 'cadastroAlunos.dart';
bool acessgaranted=true;
bool item1=false;
bool item2=false;
bool item3=false;
bool item4=false;
bool item5=false;
bool item6=false;
bool item7=false;
bool item8=false;
bool item9=false;
bool selectedS=false;

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
  int menuColor = 0xff15355C;
  int iconColor = 0xffFD7E14;



  int _selectedIndex = 0;
  String titulos = "Inicio";

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

                leading: Icon(Icons.home,color:item1 ? Colors.white: Color(iconColor),),
                title: Text('Início',style: TextStyle(color: Colors.white),),
                selected:item1,

                onTap: () {
                  _selectedIndex=0;
                  _onSelectItem(0);
                  titulos = "início";
                  item1=true;
                  item2=false;
                  item3=false;
                  item4=false;
                  item5=false;
                  item6=false;
                  item7=false;
                  item8=false;
                  item9=false;


                },

              ),
              ListTile(
                leading: Icon(Icons.book,color:item2 ? Colors.white: Color(iconColor),),
                title: Text('Meu Curso',style: TextStyle(color: Colors.white),),
                selected:item2,
                onTap: () {
      _selectedIndex=1;
                 setState(() {
                   item1=false;
                   item2=true;
                   item3=false;
                   item4=false;
                   item5=false;
                   item6=false;
                   item7=false;
                   item8=false;
                   item9=false;
                 });
                  _onSelectItem(1);
                  titulos = "Meu Curso";
                },
              ),
              ListTile(
                title: Text('Minhas Notas',style: TextStyle(color: Colors.white),),
                leading: Icon(
                  Icons.calendar_view_month,
                  color:item3 ? Colors.white: Color(iconColor),),
                  selected: 2 == _selectedIndex,
                onTap: () {
                  setState(() {
                    item1=false;
                    item2=false;
                    item3=true;
                    item4=false;
                    item5=false;
                    item6=false;
                    item7=false;
                    item8=false;
                    item9=false;
                  });
                  _onSelectItem(2);
                  titulos = "Minhas Notas";
                },
              ),
             if(acessgaranted==true) ListTile(
               title: Text('Cadastrar Aluno',style: TextStyle(color: Colors.white),),
               leading: Icon(Icons.person_add,color:item4 ? Colors.white: Color(iconColor),),
               selected: item4,
               onTap: () {
                 _selectedIndex=3;
                 setState(() {
                   item1=false;
                   item2=false;
                   item3=false;
                   item4=true;
                   item5=false;
                   item6=false;
                   item7=false;
                   item8=false;
                   item9=false;
                 });
                 _onSelectItem(3);
                 titulos = "Cadastrar Alunos";

               },
             ),


              ListTile(
                title: Text('Requerimentos',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.note_add,color:item5 ? Colors.white: Color(iconColor)),
                selected: 4 == _selectedIndex,
                onTap: () {
                  _onSelectItem(4);
                  setState(() {
                    item1=false;
                    item2=false;
                    item3=false;
                    item4=false;
                    item5=true;
                    item6=false;
                    item7=false;
                    item8=false;
                    item9=false;
                  });
                  titulos = "Requerimentos";

                },
              ),



              ListTile(
                title: Text('Sair',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.exit_to_app,color: Color(iconColor),),

                selected: 4 == _selectedIndex,
                onTap: () {
                  _onSelectItem(5);
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

      case 5:
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

