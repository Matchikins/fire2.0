

import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/model/aluno/AlunoModel.dart';
import 'package:cefops/Src/repository/aluno/AlunosRepository.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/controller/documents_controller.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_details-menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

GetStudants(){
  String fullName="";
  var infos=StudantAllInfoController.data.studantsInfo;
  return FutureBuilder(

      future: GetAllAlunos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<AlunoModel>> snapshot) {
        print(snapshot.error);
        if (snapshot.hasData) {
          var data=snapshot.data;
          return ListView.builder(

              itemCount: data!.length,
              itemBuilder:( BuildContext context,int Index){
                return ExpansionTile(

                  title: Container(
                    child:Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(data[Index].photo),

                        ),

                        SizedBox(
                          width: 22,
                        ),
                        Text(data[Index].name+ " "+data[Index].lastName,style: TextStyles.titleListTile,),
                        SizedBox(
                          width: 22,
                        ),

                      ],
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text("CPF: ${data[Index].cpf}",style: TextStyles.titleListTile),
                    ),
                    ListTile(
                      title: Text("E-mail: ${data[Index].email}",style: TextStyles.titleListTile),
                    ),

                    Container(
                      child: Row(
                        children: [
                          Container(child: TextButton(  child: Text("Editar",style: TextStyle(color: AppColors.blue),),onPressed: (){
                            final DateTime now = data[Index].dataNanscimento;
                            final DateFormat formatter = DateFormat('dd-MM-yyyy');
                            final String formatted = formatter.format(now);
                            fullName=data[Index].name+" "+data[Index].lastName;
                            infos.name.value=data[Index].name;
                            infos.lastName.value=data[Index].lastName;
                            infos.email.value=data[Index].email;
                            infos.photo.value=data[Index].photo;
                            infos.fullName.value=fullName;
                            infos.teleCelular.value=data[Index].teleFoneCelular;
                            infos.teleResidencial.value=data[Index].teleFone;
                            infos.dataNacimento.value=formatted.toString();
                            infos.sexo.value=data[Index].sexo;
                            infos.nacionalidade.value=data[Index].nacionalidade;
                            infos.stsCivil.value=data[Index].estadoCivil;
                            StudandDetailsController.details.setActive(data[Index].enable);
                            StudantInfoController.data.sexo.value=data[Index].sexo;
                            StudandDetailsController.details.civilState.value=data[Index].estadoCivil;
                            DocumentsController.data.cpf.value=data[Index].cpf;
                            AlunoDetails(context);

                          })),
                          TextButton( child: Text("Suspender",style: TextStyle(color: AppColors.orange)),onPressed: (){
                          }),
                          TextButton( child: Text("Deletar",style: TextStyle(color: Colors.red)),onPressed: (){}),

                        ],
                      ),
                    )
                  ],

                );
              }
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Text("Erro ao buscar dados" + snapshot.error.toString()),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
                color: AppColors.blue, backgroundColor: AppColors.orange),
          );
        }
      });


}