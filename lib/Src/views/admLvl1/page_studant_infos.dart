
import 'package:cefops/Src/widgets/widget_FormsForAll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewInfoFromStudant extends StatelessWidget {
  const ViewInfoFromStudant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final NameController = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        color: Colors.blue,
        child: Form(
        key: _formKey,
          child:Column(
            children: [
              inputsForms(NameController, "Insira o nome Aluno ",
              "Nome Aluno", "Por favor preencha o nome do aluno"),
            ],
          ) ,)
      ),
    );
  }
}
