
import 'package:cefops/Src/views/page_Socre.dart';
import 'package:cefops/Src/views/page_SiginStudant.dart';
import 'package:cefops/Src/views/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page_editNews.dart';
import '../page_Login-android.dart';
import '../Page_Login.dart';
import 'package:websafe_platform/websafe_platform.dart';
import 'package:get/get.dart';
var websafePlatform = WebsafePlatform();

bool isIos = websafePlatform.isIOS();
bool isWeb = websafePlatform.isWeb();
bool isAndroid=websafePlatform.isAndroid();
bool acessgaranted=true;
final testt=GetPlatform.isMobile;
final windows=GetPlatform.isDesktop;



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
            name: "/notes",
            page: ()=> NotesPage()),GetPage(
            name: "/navegation",
            page: ()=> MyApp()),
        GetPage(
            name: "/siginStudant",
            page: ()=> SiginStudant()),
        GetPage(
            name: "/editNews",
            page: ()=> EditNews()),


      ],

    );
  }
}
 _viewDetect(){

  try{
    if(windows==false){
    return loginPage_Mobile();

  }
    else return loginPage();

  } catch(e){return loginPage();}
}
