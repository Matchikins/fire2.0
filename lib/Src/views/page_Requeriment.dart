import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/views/widgets/background.dart';
import 'package:flutter/material.dart';
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
                      color: Colors.white ,
                      width: size.width*0.4,
                      height: size.height*0.04,
                      child: Center(child: Text("Comprovante de Matrícula",style: TextStyles.titleRegular,)),
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
