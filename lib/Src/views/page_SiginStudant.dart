import 'package:cefops/Src/model/model_Aluno.dart';
import 'package:cefops/Src/repository/post/postAlunoRepository.dart';
import 'package:cefops/Src/views/widgets/widget_FormsForAll.dart';
import 'package:flutter/material.dart';

class SiginStudant extends StatefulWidget {
  @override
  _SiginStudantState createState() => _SiginStudantState();
}
bool isplataform=false;
class _SiginStudantState extends State<SiginStudant> {
  final _formKey = GlobalKey<FormState>();

  final NameController = TextEditingController();
  final LastNameController = TextEditingController();
  final grupeController = TextEditingController();
  final passwController = TextEditingController();
  final emailController = TextEditingController();
  final raController = TextEditingController();
  final telController = TextEditingController();
  final cursoController = TextEditingController();
  final turmaController = TextEditingController();
 int colorIcons=0xff15355C;
 int buttonColor=0xffFD7E14;

 String dropdownValue = 'Auxiliar';
  Future<AlunoModel>? criarAluno;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget  build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var SizeForm = MediaQuery.of(context).size.width * 0.4;
    var space =MediaQuery.of(context).size.height * 0.01;

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
                ),  _space(space),

                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: inputsForms(
                        NameController,
                        "Insira o nome Aluno " ,
                        "Nome Aluno",
                        "Por favor preencha o nome do aluno"
                    )
                ),

              _space(space),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: inputsForms(
                        LastNameController,
                        "Insira o Sobrenome Aluno " ,
                        "Sobrenome do Aluno",
                        "Por favor preencha o Sobrenome do aluno"
                    )
                ),
                _space(space),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: inputsForms(
                        grupeController,
                        "Insira a Turma do Aluno " ,
                        "Turma do Aluno",
                        "Por favor preencha a Turma do aluno"
                    )
                ),
                _space(space),

                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: inputsForms(
                        raController,
                        "Insira o CPF do Aluno " ,
                        "Nome CPF do Aluno",
                        "Por favor preencha o CPF do Aluno"
                    )),
                        _space(space),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child:inputsForms(
                        emailController,
                        "Insira o E-mail do Aluno " ,
                        "Nome o E-mail do Aluno",
                        "Por favor preencha o E-mail do Aluno"
                    )),
                        _space(space),
                Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: inputsForms(
                        passwController,
                        "A senha do Aluno " ,
                        "Nome senha do Aluno",
                        "Por favor preencha o senha do Aluno"
                    )
                ),


                       _space(space),

                Center(

                  child: Container(

                    width: SizeForm,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Center(child: Text("Selecione Um Curso")),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Color(0xff15355C)),
                            underline: Container(
                              height: 2,
                              color: Color(0xff15355C),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                 dropdownValue = newValue!;
                                 print(dropdownValue);
                              });
                            },
                            items: <String>['Auxiliar', 'Técnico', 'Cuidador de Idosos',]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ) ,

                        Text("Modalidade de Ensino EAD ?",
                          overflow: TextOverflow.ellipsis,),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Switch(value:isplataform , onChanged: (value){
                            setState(() {
                              isplataform=!isplataform;
                              print(isplataform);
                            });

                          }),
                        )
                      ],
                    ),
                  ),
                ),
                if(isplataform==true)Container(
                  width: SizeForm,
                  child: inputsForms(
                      cursoController,
                      "Insira o Link Da Turma na Plataforma",
                      "Insira o Link",
                      "error"),
                ),
                Container(
                  height:size.height *0.06 ,
                  width: size.width* 0.06,
                  color: Color(0xff15355C),
                  child: TextButton(
                    child: Text("Cadastrar",style: TextStyle(color: Colors.white),),

                    onPressed: (){
                      var idcontroller=int.parse(raController.text);

                      setState(() {
                       print(idcontroller);
                       print(NameController.text);
                       print(LastNameController.text);
                       print(emailController.text);
                       criarAluno=createAluno(idcontroller, NameController.text,LastNameController.text, idcontroller, emailController.text, 1);


                     });




                    },
                  ),
                )
               ],
            )
        ),
      ),
    );
  }
}


_space(double space){
  return SizedBox(
    height:space
  );
}

