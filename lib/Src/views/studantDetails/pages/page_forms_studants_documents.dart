
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:cefops/Src/repository/cepAuto/cep_repository.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_form_studantDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsStudantsDocuments extends StatelessWidget {
  const FormsStudantsDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final cpfController = TextEditingController();
    final lastController = TextEditingController();
    final stateController = TextEditingController();
    final burnInController = TextEditingController();
    final burnDataController = TextEditingController();
    final emailController = TextEditingController();
    final nationController = TextEditingController();
    var controller = StudandDetailsController.details;

    return Container(
        height: Get.height,
        width: Get.width,
        child:
        Column(
          children: [
            Row(children: [
              Container(
                height: Get.height*0.09,
                width: Get.width*0.2,
                alignment: Alignment.centerLeft,
                child:  Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType:  TextInputType.number,
                    maxLength: 11,
                    onChanged: (value){
                     if(value.length==11){
                       _formKey.currentState!.validate();
                     }



                    },
                    controller: cpfController,
                    style: TextStyle(color: Colors.black,),
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        labelText: "CPF",
                        labelStyle: TextStyles.titleRegular,
                        hintText: "Insisra o CPF",
                        hintStyle: TextStyles.input,
                        focusedBorder: OutlineInputBorder(
                        )
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "o campo cep esta vazio";
                      }
                      if (value.isCpf==false) {
                        return "CPF Invalido";
                      }return null;

                    },
                    maxLines: 1,
                  ),
                ),
              ),

              IconButton(
                  onPressed: () {
                    if(nationController.value.text.length==11){

                    }else {
                      print("Error");
                    }

                  },
                  icon: Icon(Icons.search)),
              Obx(
                      () {
                    return Container(
                      child:  FormStudntDetails(
                          nationController
                            ..text = '${cepControll.cepst.logradouro}',
                          "Titulo eleitoral",
                          "Insira o Titulo eleitoral",
                          "preencha o Titulo eleitoral "),
                    );
                  }
              ),
            ]
            ),
            Row(
              children: [
                Obx(
                        () {
                      return Container(
                        child:  FormStudntDetails(
                            nationController
                              ..text = '${cepControll.cepst.bairro}',
                            "RG",
                            "Insira o RG",
                            "preencha o RG "),
                      );
                    }
                ),
                SizedBox(width: Get.width*0.02,),
                Obx(
                        () {
                      return Container(
                        child:  FormStudntDetails(
                            nationController
                              ..text = '${cepControll.cepst.complemento}',
                            "Estado Emissor",
                            "Insira o Estado Emissor",
                            "preencha o Estado Emissor"),
                      );
                    }
                ),
              ],
            ),
            Obx(
                    () {
                  return Container(
                    child:  Row(
                      children: [
                        FormStudntDetails(
                            nationController
                              ..text = '${cepControll.cepst.localidade}',
                            "Estado Emissor RG",
                            "Insira o RG",
                            "preencha o RG "),
                        SizedBox(width: Get.width*0.02,),

                        Container(
                          child:  FormStudntDetails(
                              nationController
                                ..text = '${cepControll.cepst.uf}',
                              "Zona",
                              "Zona",
                              "Zona ") ,
                          width: Get.width*0.05,
                        ),
                        SizedBox(width: Get.width*0.02,),
                        Container(
                          child:  FormStudntDetails(
                              nationController,
                              "Seção",
                              "Seção",
                              "Seção "), width: Get.width*0.05,),
                        SizedBox(width: Get.width*0.02,),
                        FormStudntDetails(
                            nationController
                              ..text = '${cepControll.cepst.localidade}',
                            "Data de Emissão",
                            "Insira a  Data de Emissão",
                            "preencha a Data de Emissão "),

                      ],
                    ),
                  );
                }
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: FormStudntDetails(
                  nationController
                    ..text = '${cepControll.cepst.localidade}',
                  "Data de Emissão RG",
                  "Insira a  Data de Emissão do RG",
                  "preencha a Data de Emissão "),
            ),
            SizedBox(
              height: Get.height*0.05,
            ),
            Center(

            ),
            ElevatedButton(
                onPressed: (){controller.navegar.value=1;},
                child: Text("Continuar")),

          ],
        )
    );
  }
}
