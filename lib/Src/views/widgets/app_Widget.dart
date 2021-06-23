import 'package:cefops/Src/get/get_connect_bindings.dart';
import 'package:cefops/Src/get/get_connect_page.dart';
import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/cadastroAlunos.dart';
import 'package:cefops/Src/views/navegacaoHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home.dart';
import '../loginPage-android.dart';
import '../loginPage.dart';
import 'package:websafe_platform/websafe_platform.dart';
var websafePlatform = WebsafePlatform();

bool isIos = websafePlatform.isIOS();
bool isWeb = websafePlatform.isWeb();
bool isAndroid=websafePlatform.isAndroid();
bool acessgaranted=true;



class AppWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      getPages: [
        GetPage(
            name: "/",
            page: ()=>_viewDetect()
        ),
        GetPage(
            name: "/home",
            page: ()=> HomePage()),
        GetPage(
            name: "/notes",
            page: ()=> NotesPage()),GetPage(
            name: "/navegation",
            page: ()=> MyApp()),
        GetPage(
            name: "/siginStudant",
            page: ()=> SiginStudant()),
        GetPage(
            name: "/tr",
            page:()=> GetConnectPage(),
          binding: GetConnectBindings(),
        ),



      ],

    );
  }
}
 _viewDetect(){
  print(isAndroid);
  try{
    if(isAndroid||isIos){
    return loginPage_Mobile();

  }
    else return loginPage();

  } catch(e){return loginPage();}
}
