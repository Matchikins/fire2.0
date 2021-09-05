import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Repository/LoginRepository.dart';
import 'package:cefops/Shared/Security/Services/USerServices.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/views/page_Home.dart';
import 'package:cefops/Src/widgets/widget_App.dart';
import 'package:cefops/Src/widgets/widget_ButtonLogin.dart';
import 'package:cefops/Src/widgets/widget_FormsForLoginPage.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:get/get.dart';

var _controler;
final _formKey = GlobalKey<FormState>();
final UserController = TextEditingController();
final passwController = TextEditingController();
String os = Platform.operatingSystem;
bool android = false;
int colorIcons = 0xff15355C;

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void initState() {

    super.initState();
    _controller = AnimationController(vsync: this);

  }

  @override
  void dispose() {
    UserController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        body: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/enfermagem.jpg"),
                    fit: BoxFit.cover
                )

            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(

              child: Center(
                  child: Container(

                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(

                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Image.asset(
                          Res.cefops1_orig,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: LoginForms(
                            UserController,
                            "Insira Seu Usuário",
                            "Usuário",
                            "Por Favor informe seu  Usuário",
                            Icons.person,
                            false,
                            colorIcons,
                            false,
                            context),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Obx(
                            () => LoginForms(
                                passwController,
                                "Insira Sua Senha",
                                "Senha",
                                "Por Favor Informe sua Senha",
                                Icons.lock,
                                statusApp.status.verSenha.value,
                                colorIcons,
                                true,
                                context),
                          )),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Expanded(

                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () async{
                                await Login("Emison", "1234");
                                if(    ErroController.error.ok==true){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  MyApp()),
                                  );


                                }


                              },
                              child: Text(
                                'Esqueci a Senha',overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Center(
                          child: Obx(() => Text(
                                "${statusApp.status.erros1.value}",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                          child: Obx(() => statusApp.status.loading.value
                              ? CircularProgressIndicator(
                                  backgroundColor: AppColors.background,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      AppColors.blue),
                                )
                              : logginButon(
                                  context,
                                  _formKey,
                                  UserController.text,
                                  passwController.value.text)))
                    ],
                  ),
                ),
              )),
            ),
          );
        }),
      ),

    );

  }
}
