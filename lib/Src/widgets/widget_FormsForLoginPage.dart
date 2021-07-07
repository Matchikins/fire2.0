import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';

LoginForms(Controller, String labels, String hintTExt, String error,
    IconData icons, bool isobscure, int colorIcon) {
  return TextFormField(
    controller: Controller,
    style: TextStyle(
      color: AppColors.textOnSecondary,
    ),
    decoration: InputDecoration(
        fillColor: Colors.black,
        prefixIcon: Icon(
          icons,
          color: Color(colorIcon),
        ),
        labelText: labels,
        labelStyle: TextStyles.titleListTile,
        hintText: hintTExt,
        hintStyle: TextStyle(
          color: AppColors.blue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.orange),
          borderRadius: BorderRadius.circular(10),
        )),
    obscureText: isobscure,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return error;
      }
      return null;
    },
  );
}
