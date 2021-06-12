import 'package:cefops/Src/Repository/repositoryCourse.dart';
import 'package:cefops/Src/views/home.dart';
import 'package:cefops/Src/views/navegacaoHome.dart';
import 'package:cefops/Src/views/widget/SiginStudant_Widget.dart';
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

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    COnnect();

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
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        body: Builder(builder: (context) {
          return Container(
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
                        child: TextFormField(
                          controller: UserController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.black,
                              icon: Icon(
                                Icons.person,
                                color: Color(0xff15355C),
                              ),
                              labelText: 'Usuário ',
                              labelStyle: TextStyle(color: Color(0xff15355C)),
                              hintText: 'Insira Seu Usuário',
                              hintStyle: TextStyle(color: Color(0xff15355C)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff15355C)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff15355C)),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por Favor Insira Seu Usuário';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          controller: passwController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por Favor Insira Sua Senha';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.black,
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xff15355C),
                              ),
                              labelText: 'Senha ',
                              labelStyle: TextStyle(color: Color(0xff15355C)),
                              hintText: 'Insira Sua Senha',
                              hintStyle: TextStyle(color: Color(0xff15355C)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff15355C)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xff15355C)),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          obscureText: true,
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

                        child: FlatButton(
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),

                          color: Color(0xffFD7E14),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xff15355C),
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(7)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute<Null>(
                                    builder: (BuildContext context) {
                                      return MyApp();
                                    },
                                    fullscreenDialog: true,
                                  ));
                            } else {}
                          },
                        ),
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
device(){
  if (os=="android"){

  }
}