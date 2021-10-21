
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:cefops/Src/repository/cepAuto/cep_repository.dart';
import 'package:cefops/Src/views/Security/Singup.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_form_studantDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudantAnddress extends StatelessWidget {
  const StudantAnddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page=1;
    final cepController = TextEditingController();
    final ruaController = TextEditingController();
    final complementoController = TextEditingController();
    final cidadeController = TextEditingController();
    final estadoController = TextEditingController();
    final ufController = TextEditingController();
    final numeroController = TextEditingController();
    final bairroController = TextEditingController();
    var controller = StudandDetailsController.details;


    return Container(
      height: Get.height,
      width: Get.width,
      child:
      Column(
        children: [
          Row(children: [
          Container(
            height: Get.height*0.08,
            width: Get.width*0.2,
            alignment: Alignment.centerLeft,
            child:  TextFormField(
              maxLength: 8,
              onChanged: (value){
                if(value.length==8){
                  Future.delayed(const Duration(seconds: 2),(){
                    GetCep(cepController.value.text);
                  });
                }
              },
              controller: cepController,
              style: TextStyle(color: Colors.black,),
              decoration: InputDecoration(
                  fillColor: Colors.black,
                  labelText: "CEP",
                  labelStyle: TextStyles.titleRegular,
                  hintText: "Insisra o cep",
                  hintStyle: TextStyles.input,
                  focusedBorder: OutlineInputBorder(
                  )
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "o campo cep esta vazio";
                }
                return null;
              },
              maxLines: 1,
            ),
          ),

          IconButton(
              onPressed: () {
                if(cepController.value.text.length==8){
                  GetCep(cepController.value.text);
                }else {
                  print("Error");
                }

              },
              icon: Icon(Icons.search)),
            Obx(
              () {
                return Container(
                  child:  FormStudntDetails(
                      ruaController
                        ..text = '${cepControll.cepst.logradouro}',
                      "Endereço",
                      "Insira o Endereço",
                      "preencha o Endereço "),
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
                          bairroController
                            ..text = '${cepControll.cepst.bairro}',
                          "bairro",
                          "Insira o bairro",
                          "preencha o bairro "),
                    );
                  }
              ),
              SizedBox(width: Get.width*0.02,),
              Obx(
                      () {
                    return Container(
                      child:  FormStudntDetails(
                          complementoController
                            ..text = '${cepControll.cepst.complemento}',
                          "complemento",
                          "Insira o complemento",
                          "preencha o complemento "),
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
                          cidadeController
                            ..text = '${cepControll.cepst.localidade}',
                          "Cidade",
                          "Insira o Cidade",
                          "preencha o Cidade "),
                      SizedBox(width: Get.width*0.02,),
                      Container(
                        child:  FormStudntDetails(
                           estadoController
                              ..text = '${cepControll.cepst.estado}',
                            "Estado",
                            "Estado",
                            "Estado ") ,
                        width: Get.width*0.1,
                      ),
                      SizedBox(width: Get.width*0.02,),
                      Container(
                        child:  FormStudntDetails(
                            ufController
                              ..text = '${cepControll.cepst.uf}',
                            "UF",
                            "UF",
                            "UF ") ,
                        width: Get.width*0.05,
                      ),
                      SizedBox(width: Get.width*0.02,),
                    Container(
                    child:  FormStudntDetails(
                    numeroController,
                    "número",
                    "número",
                    "número "), width: Get.width*0.05,),
                    ],
                  ),
                );
              }
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
