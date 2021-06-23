import 'package:flutter/material.dart';

 inputsForms(Controller, String labels,String hintTExt, String error,   ){
   return TextFormField(

     controller: Controller,
     style: TextStyle(color: Colors.black,),
     decoration: InputDecoration(

         fillColor: Colors.black,

         labelText: labels,

         labelStyle: TextStyle(color: Color(0xff15355C), ),
         hintText: hintTExt,
         hintStyle: TextStyle(color: Color(0xff15355C)),
         focusedBorder: OutlineInputBorder(

         )
     ),

     validator: (value) {
       if (value == null || value.isEmpty) {
         return error;
       }
       return null;
     },
   );

 }
