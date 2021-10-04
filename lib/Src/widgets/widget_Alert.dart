import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_FormsForAll.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(BuildContext context) {
  final CpfController = TextEditingController();
  final size =MediaQuery.of(context).size;
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed:  () {
      Get.to(MyApp());

    },
  );
  Widget continueButton = TextButton(
    child: Text("Salvar"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
      child: Text("Cadastrando um Novo Requerimento ",style: TextStyle(
        color: Colors.red
      ),),
    ),
    content:Container(
      width: size.width /2,
      child: Column(
        children: [
          inputsForms(CpfController, "CPF do Aluno", "CPF", "Preencha o Campo"),
          Container(
            child: Row(
              children: [
             Container(

               child:
             inputsForms(CpfController, "CPF do Aluno", "CPF", "Preencha o Campo"),),
                SizedBox(width: size.width*0.04,),
                Text("0sdsd21"),


              ],
            ),
          )


        ],
      ),


    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}