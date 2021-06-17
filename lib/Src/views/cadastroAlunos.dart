import 'package:cefops/Src/views/widgets/LoginForms_widget.dart';
import 'package:flutter/material.dart';

class SiginStudant extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final NameController = TextEditingController();
  final passwController = TextEditingController();
  final emailController = TextEditingController();
  final raController = TextEditingController();
  final telController = TextEditingController();
  final cursoController = TextEditingController();
  final turmaController = TextEditingController();
 int colorIcons=0xff15355C;
 int buttonColor=0xffFD7E14;
  @override
  Widget build(BuildContext context) {
    var SizeForm = MediaQuery.of(context).size.width * 0.4;
    return Container(

      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Cadastrar novo aluno ",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: LoginForms(
                        NameController,
                        "Insira o Nome do Aluno",
                        "Nome Aluno",
                        "Por favor prencha o campo Nome Aluno ",
                        Icons.person,
                        false,
                        colorIcons
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: LoginForms(
                        raController,
                        "Insira o CPF do Aluno",
                        "CPF Aluno",
                        "Por favor prencha o campo CPF Aluno ",
                        Icons.lock_clock,
                        false,
                        colorIcons
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: LoginForms(
                        emailController,
                        "Insira o E-mail do Aluno",
                        "E-mail",
                        "Por favor prencha o campo E-mail ",
                        Icons.email,
                        false,colorIcons
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: LoginForms(
                        passwController,
                        "Insira a Senha do Aluno",
                        "Senha",
                        "Por favor prencha o campo Senha ",
                        Icons.lock,
                        true,
                        colorIcons),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                Center(
                  child:FlatButton(
                    color: Color(buttonColor),
                    child: Text("TEste harmonia",style: TextStyle(color: Colors.white),),
                    onPressed: (){},
                  ) ,)
              ],
            )),
      ),
    );
  }
}
