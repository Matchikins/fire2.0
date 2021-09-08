import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/module/pdf/ComprovanteMatriculaPDFModel.dart';
import 'package:cefops/Src/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
class RequeriViews extends StatelessWidget {
  const RequeriViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return backgroundColor(
      size.width,
      size.height,
      Column(
        children: [
          Container(
            child: Column(
              children: [

                    Container(
                      color: Colors.white,
                  width: size.width * 0.6,
                  height: size.height * 0.06,
                  child: Obx(

                    () => Center(
                        child: TextButton(
                      child:statusApp.status.loading.value ?
                      CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.amber,
                      ): Text(
                        "Comprovante de Matrícula",
                        style: TextStyles.titleRegular,
                      ),
                      onPressed: () {
                        statusApp.status.loading.value=true;
                        ComprovMatricula();
                      },
                    )),
                  ),
                ),


              ],
            ),
            color: AppColors.orange,
            width: size.width*0.2,
            height: size.height*0.3,
          )
        ],
      ),
    );
  }
}
