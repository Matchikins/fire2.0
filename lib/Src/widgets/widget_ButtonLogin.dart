import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Repository/LoginRepository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:flutter/material.dart';
import 'widget_Navegation.dart';

bool isloading = false;

logginButon(context, _formKey, String user, String password) {
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
      ],
    ),
    color: AppColors.secondary,
    textColor: AppColors.textOnSecondary,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.blue, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(7)),
    onPressed: () async {
      statusApp.status.erros1.value = "";

      if (_formKey.currentState!.validate()) {
        statusApp.status.loading.value = true;
        await Login(user, password);

        if (ErroController.error.ok == true) {
          statusApp.status.loading.value = false;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      } else {}
    },
  );
}
