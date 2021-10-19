
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_dropDown_civilState.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_dropDown_gender.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_dropDown_state.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_form_studantDetails.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsStudants extends StatelessWidget {
  const FormsStudants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastController = TextEditingController();
    final stateController = TextEditingController();
    final burnInController = TextEditingController();
    final burnDataController = TextEditingController();
    final emailController = TextEditingController();
    final nationController = TextEditingController();
    var controller = StudandDetailsController.details;



    return Form(
        key: _formKey,
        child:Stack(
          children: [
          Positioned(
          left: Get.width/2,
          child: Container(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  RequerimentController.req.linkPhoto.value,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                )))),


            Positioned(
                left: Get.width/2.01,
                top: Get.height*0.2,

                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Enviar Nova foto"),
                )
            ),

            Column(
              children: [
                Row(
                  children: [
                    FormStudntDetails(nameController,
                        "Nome",
                        "Nome do Aluno",
                        "preencha o nome do aluno"),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    FormStudntDetails(lastController,
                        "Sobreome",
                        "Sobreome do Aluno",
                        "preencha o nome do Sobreome"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: Get.width*0.09,
                      child: FormStudntDetails(stateController,
                          "Estado Natal",
                          "Estado Natal",
                          "preencha o Estado Natal"),
                    ),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    FormStudntDetails(burnInController,
                        "Naturalidade",
                        "Naturalidade do Aluno",
                        "preencha A Naturalidade"),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    Container(
                      width: Get.width*0.1,
                      child: FormStudntDetails(burnDataController,
                          "Data  nascimento",
                          "Data de nascimento",
                          "preencha A Data de nascimento"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: Get.width*0.09,
                        child: DropDownGender()
                    ),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    Container(
                        width: Get.width*0.09,
                        child: DropDownStatus()
                    ),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    Container(
                        width: Get.width*0.09,
                        child: DropDownCivilState()
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width*0.01,
                ),
                Row(
                  children: [
                    FormStudntDetails(emailController,
                        "Email",
                        "Email do Aluno",
                        "preencha o Email do aluno"),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    FormStudntDetails(nationController,
                        "Nacionalidade",
                        "Nacionalidade do Aluno",
                        "preencha  a Nacionalidade"),

                  ],
                ),
                SizedBox(
                  height: Get.height*0.15,
                ),
                ElevatedButton(
                    onPressed: (){controller.navegar.value=1;},
                    child: Text("Continuar")),
              ],

            )
          ],
        )
    );
  }
}
