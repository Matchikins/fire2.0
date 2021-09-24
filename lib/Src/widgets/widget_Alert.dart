import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed:  () {
      Get.to(MyApp());

    },
  );
  Widget continueButton = TextButton(
    child: Text("Ver Conta"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alerta",style: TextStyle(
      color: Colors.red
    ),),
    content: Text("Foi detectado uma ou mais Contas em atraso"),
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