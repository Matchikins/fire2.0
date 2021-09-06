import 'dart:io';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/model/model_Publication.dart';
import 'package:cefops/Src/views/studants/page_Socre.dart';
import 'package:cefops/Src/views/admLvl1/page_editNews.dart';
import 'package:cefops/Src/views/page_Home.dart';

import 'package:cefops/Src/widgets/widget_NavegatorRoutes.dart';

import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';


bool acessgaranted = true;
bool studantPage=false;
final ismobiles=GetPlatform.isMobile;
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

  int selectedIndex = 0;
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
            child: Image.asset(Res.logo_branco_Laranja),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(menuColor),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.primary
                ),
                  accountName: Text("${UserController.user.name} ${UserController.user.lastName}"),
                  accountEmail: Text("${UserController.user.email}"),
                  currentAccountPicture:Center(child:
                  CircleAvatar(child: Image.network("${UserController.user.photo}"),),),
              ),
              Divider(color: AppColors.background,),



                ListTile(
                tileColor: Colors.white,
                leading: Icon(
                  Icons.home,
                  color: Color(iconColor),
                ),
                title: Text(
                  'Início',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  selectedIndex = 0;
                  onSelectItem(0);
                  titulos = "início";
                },
              ),
              if (studantPage == true)  ListTile(
                leading: Icon(
                  Icons.book,
                  color: Color(iconColor),
                ),
                title: Text(
                  'Meu Curso',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  selectedIndex = 1;

                  onSelectItem(1);
                  titulos = "Meu Curso";
                },
              ),
              if (studantPage == true)  ListTile(
                title: Text(
                  'Minhas Notas',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.calendar_view_month,
                  color: Color(iconColor),
                ),
                selected: 2 == selectedIndex,
                onTap: () {
                  onSelectItem(2);
                  titulos = "Minhas Notas";
                },
              ),


              if (studantPage == true)  ListTile(
                title: Text(
                  'Requerimentos',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.note_add, color: Color(iconColor)),
                selected: 5 == selectedIndex,
                onTap: () {
                  onSelectItem(5);

                  titulos = "Requerimentos";
                },
              ),
              if (studantPage == true)   ListTile(
                title: Text(
                  'Financeiro',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.description, color: Color(iconColor)),
                selected: 5 == selectedIndex,
                onTap: () {
                  onSelectItem(5);

                  titulos = "Financeiro";
                },
              ),
              if (acessgaranted == true)
                ListTile(
                  title: Text(
                    'Cadastrar Aluno',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.person_add,
                    color: Color(iconColor),
                  ),
                  onTap: () {
                    selectedIndex = 3;
                    onSelectItem(3);
                    titulos = "Cadastrar Alunos";
                  },
                ),
              if (acessgaranted == true)
                ListTile(
                  title: Text(
                    'Listar Alunos',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.person_search,
                    color: Color(iconColor),
                  ),
                  onTap: () {
                    selectedIndex = 4;
                    onSelectItem(4);
                    titulos = "Listar Alunos";
                  },
                ),
              if (acessgaranted == true)
                ListTile(
                  title: Text(
                    'Status Requerimentos',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.web_asset_outlined,
                    color: Color(iconColor),
                  ),
                  onTap: () {
                    selectedIndex = 7;
                    onSelectItem(7);
                    titulos = "Status Requerimentos";
                  },
                ),
              if (acessgaranted == true)
                ListTile(
                  title: Text(
                    'Status Financeiro',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.request_quote,
                    color: Color(iconColor),
                  ),
                  onTap: () {
                    selectedIndex = 8;
                    onSelectItem(8);
                    titulos = "Status Financeiro";
                  },
                ),
              if (acessgaranted == true)
              ListTile(
                title: Text(
                  'Postagem',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(Icons.description, color: Color(iconColor)),
                selected: 6 == selectedIndex,
                onTap: () {
                  onSelectItem(6);


                  titulos = "Postagem";
                },
              ),
              ListTile(
                title: Text(
                  'Sair',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color(iconColor),
                ),
                selected: 7 == selectedIndex,
                onTap: () {
                  onSelectItem(7);
                },
              ),

            ],
          ),
        ),
      ),
      body:   getDrawerItem(selectedIndex,context: context),
    );
  }




  onSelectItem(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.of(context).pop();
  }
}

mobile(){
  if(ismobile==true){
    acessgaranted=true;
  }else{
    acessgaranted=true;
  }
}