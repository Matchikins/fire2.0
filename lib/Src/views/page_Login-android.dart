import 'package:cefops/Src/views/widgets/widget_ButtonLogin.dart';
import 'package:cefops/Src/views/widgets/widget_FormsForLoginPage.dart';
import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
var _controler;
final _formKey = GlobalKey<FormState>();
final UserController = TextEditingController();
final passwController = TextEditingController();
String os = Platform.operatingSystem;
bool android=false;
int widet=1;
int height=1;
int colorIcons=0xff15355C;

class loginPage_Mobile extends StatefulWidget {
  @override
  _loginPage_MobileState createState() => _loginPage_MobileState();
}

class _loginPage_MobileState extends State<loginPage_Mobile>
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


      home: Scaffold(
        backgroundColor:  Colors.black,
        body: Builder(builder: (context) {
          return Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Color(0xff15355C),
              child: Center(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *0.20,
                        width: MediaQuery.of(context).size.width *0.50,
                        child: Image.asset(
                          Res.logoBranca,
                        ),
                        margin: EdgeInsets.only(bottom: 0.0),
                      ),
                     Container(
                       width: MediaQuery.of(context).size.width*0.90,
                       child:  LoginForms(
                           UserController,
                           "Insira Seu Usuário",
                           "Usuário",
                           "Por Favor informe seu  Usuário",
                           Icons.person,
                         false,
                       colorIcons),
                     ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.90,
                        child:LoginForms(
                          passwController,
                          "Insira Sua Senha",
                          "Senha",
                          "Por Favor Informe sua Senha",
                          Icons.lock,
                          true,
                          colorIcons
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                          ),
                          Container(

                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Esqueci a Senha',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(

                        child: logginButon(context,_formKey)
                      )
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