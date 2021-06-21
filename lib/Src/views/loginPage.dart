import 'package:cefops/Src/models/postesModel.dart';
import 'package:cefops/Src/repository/postsRepository.dart';
import 'package:cefops/Src/views/widgets/ButtonLogin_widget.dart';
import 'package:cefops/Src/views/widgets/LoginForms_widget.dart';
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

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Future<post> pos;

  @override
  void initState() {

    super.initState();
    pos=postes() as Future<post>;
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
                          "assets/images/logo.png",
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
                            colorIcons),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: LoginForms(
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
                            width: MediaQuery.of(context).size.width * 0.3,
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

                        child: logginButon(context, _formKey)
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
