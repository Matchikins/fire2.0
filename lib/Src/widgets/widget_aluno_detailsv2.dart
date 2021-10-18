import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/controller/requeriment_view_controller.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_studant_infos_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cefops/Src/controller/status.dart';


AlunoDetails(BuildContext context) {
  final cpfController = TextEditingController();
  final nameController = TextEditingController();
  final observaao = TextEditingController();


  final size = MediaQuery.of(context).size;
  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
    },
  );
  Widget continueButton = TextButton(
    child: Text("Salvar"),
    onPressed: () {
      CeeateRequeriment(
          RequerimentTypeController.reqType.selected,
          RequerimentController.req.idStudant.value);

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Container(
      child: Column(

        children: [
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Text("Geremias dsfssssssssssssssssssssss",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.end,),
          ),
          Row(
            children: [

              ElevatedButton( onPressed: (){
                statusApp.status.navegar.value=0;              },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                  ),
                  child: Center(
                    child: Text("Info"),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width*0.01,
              ),
              ElevatedButton( onPressed: (){
                statusApp.status.navegar.value=1;              },
                child: Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(

                  ),
                  child: Center(
                    child: Text("Notas"),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width*0.01,
              ),
              ElevatedButton( onPressed: (){
                print("Clicou no 3");
              },
                child: Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(

                  ),
                  child: Center(
                    child: Text("Diario"),
                  ),
                ),
              ),
            ],
          ),
      SizedBox(
        height:Get.height*0.01 ,
      ),
          SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height*0.64,
          child: Obx(
              () => SetStudantPage(statusApp.status.navegar.value,
              context: context),
  ),
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
