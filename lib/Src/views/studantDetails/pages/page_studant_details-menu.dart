import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/views/studantDetails/controller/documents_controller.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_studant_infos_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cefops/Src/controller/status.dart';


AlunoDetails(BuildContext context) {

  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      DocumentsController.data.deleteAllData();
      Get.back();    },
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
            child: Obx(
              () {
                return Text("${StudantInfoController.data.fullName}",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.end,);
              }
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:  Colors.orange
                ),
                onPressed: (){
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Colors.orange
                ),
                onPressed: (){
                statusApp.status.navegar.value=1;              },
                child: Container(
                  width: 60,
                  height: 40,
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Colors.orange
                ),
                onPressed: (){

              },
                child: Container(
                  width: 60,
                  height: 40,
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
          width: Get.width*0.7,
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
