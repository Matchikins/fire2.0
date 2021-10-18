
import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:cefops/Src/repository/cepAuto/cep_repository.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_form_studantDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudantAndress extends StatelessWidget {
  const StudantAndress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cepController = TextEditingController();
    final bairroController = TextEditingController();

    return Container(
      height: Get.height,
      width: Get.width,
      child:
      Column(
        children: [
          Row(children: [
          Container(
            child:  FormStudntDetails(
                cepController,
                "Cep",
               "Insira o cep",
               "preencha o cep "),
          ),
          IconButton(
              onPressed: () {
                GetCep(cepController.value.text);
                print(cepController.value.text);
              },
              icon: Icon(Icons.search)),
            Obx(
              () {
                return Container(
                  child:  FormStudntDetails(
                      TextEditingController()
                        ..text = '${cepControll.cepst.bairro}',
                      "Cep",
                      "Insira o cep",
                      "preencha o cep "),
                );
              }
            ),
    ]
          ),
        ],
      )
    );
  }
}
