import 'package:cefops/Shared/Security/Repository/LoginRepository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'widget_Navegation.dart';

bool isloading = false;

logginButon(context, String user, String password) {
  final size = MediaQuery.of(context).size;

  return FlatButton(
    height: size.height * 0.07,
    child: Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
              fontSize: size.height * 0.03, fontWeight: FontWeight.w500),
        ),
        if (isloading == true)
          CircularProgressIndicator(
            backgroundColor: AppColors.background,
            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.blue),
          )
      ],
    ),
    color: AppColors.secondary,
    textColor: AppColors.textOnSecondary,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.blue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(7)),
    onPressed: () {



      // if (_formKey.currentState!.validate()) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute<Null>(
      //         builder: (BuildContext context) {
      //           return MyApp();
      //         },
      //         fullscreenDialog: true,
      //       ));
      // } else {}
    },
  );
}
