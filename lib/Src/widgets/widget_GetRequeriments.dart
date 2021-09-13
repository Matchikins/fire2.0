
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/adm/RequerimentModel.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:flutter/material.dart';

 GetRequeriments(snapshot) {
   print("********");
   print(snapshot);
   print("********");
 return ListView.builder(

    itemCount: snapshot.data!.length,
    itemBuilder:( BuildContext context,int Index){
      return ExpansionTile(

        title: Container(
          child:Row(
            children: [

              SizedBox(
                width: 22,
              ),

              SizedBox(
                width: 22,
              ),

            ],
          ),
        ),
        children: [
          ListTile(
            title: Text("CPF: ${snapshot.data![Index].aluno.id}",style: TextStyles.titleListTile),
          ),


        ],

      );
    }

);

}