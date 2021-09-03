import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';

 inputsForms(Controller, String labels,String hintTExt, String error,   ){
   return TextFormField(

     controller: Controller,
     style: TextStyle(color: Colors.black,),
     decoration: InputDecoration(

         fillColor: Colors.black,

         labelText: labels,

         labelStyle: TextStyles.titleRegular,
         hintText: hintTExt,
         hintStyle: TextStyles.input,
         focusedBorder: OutlineInputBorder(

         )
     ),

     validator: (value) {
       if (value == null || value.isEmpty) {
         return error;
       }
       return null;
     },
     maxLines: 2,
   );

 }
