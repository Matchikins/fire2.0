import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/arequeriment.dart';
import 'package:cefops/Src/views/cadastroAlunos.dart';
import 'package:cefops/Src/views/navegacaoHome.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import '../loginPage-android.dart';
import '../loginPage.dart';
import 'package:websafe_platform/websafe_platform.dart';
var websafePlatform = WebsafePlatform();

bool isIos = websafePlatform.isIOS();
bool isWeb = websafePlatform.isWeb();
bool isAndroid=websafePlatform.isIOS();
bool acessgaranted=false;

class AppWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    print("********************");
    print("teste");
    print("********************");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/': (context) => _viewDetect(),
        '/home': (context) => HomePage(),
        "/notes": (context) => NotesPage(),
        "/navegation": (context) => MyApp(),
        "/siginStudant":(context)=>SiginStudant(),
      },
    );
  }
}
 _viewDetect(){
  try{
    if(isAndroid||isIos){
    return loginPage_Mobile();

  }
    else return loginPage();

  } catch(e){return loginPage();}
}
