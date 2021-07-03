import 'package:flutter/material.dart';


LoginForms(Controller, String labels,String hintTExt, String error, IconData icons, bool isobscure,int  colorIcon){
 return TextFormField(

    controller: Controller,
    style: TextStyle(color: Colors.black,),
    decoration: InputDecoration(

        fillColor: Colors.black,
        prefixIcon: Icon(icons,color: Color(colorIcon),
        ),
        labelText: labels,

        labelStyle: TextStyle(color: Color(0xff15355C), ),
        hintText: hintTExt,
        hintStyle: TextStyle(color: Color(0xff15355C)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 3, color: Colors.white),
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