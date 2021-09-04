import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/AlunoModel.dart';
import 'package:cefops/Src/repository/AlunosRepository.dart';
import 'package:cefops/Src/widgets/widget_GetAlunos.dart';
import 'package:flutter/material.dart';

class ListUSers extends StatefulWidget {
  const ListUSers({Key? key}) : super(key: key);

  @override
  _ListUSersState createState() => _ListUSersState();
}

class _ListUSersState extends State<ListUSers> {
  late Future<AlunoModel> futureAluno;
  @override
  void initState() {
    GetAlunos() ;
    print("oii");
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child:
      FutureBuilder(
          future: GetAllAlunos(),
          builder:
              (BuildContext context, AsyncSnapshot<List<AlunoModel>> snapshot) {
            print(snapshot.error);
            if (snapshot.hasData) {
              return ListView.builder(

                  itemCount: snapshot.data!.length,
                  itemBuilder:( BuildContext context,int Index){
                    return ExpansionTile(

                      title: Container(
                        child:Row(
                          children: [
                           CircleAvatar(
                               radius: 22,
                          backgroundImage: NetworkImage(snapshot.data![Index].photo),

                              ),

                            SizedBox(
                              width: 22,
                            ),
                            Text(snapshot.data![Index].name+ " "+snapshot.data![Index].lastName,style: TextStyles.titleListTile,),
                            SizedBox(
                              width: 22,
                            ),

                          ],
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text("CPF: ${snapshot.data![Index].cpf}",style: TextStyles.titleListTile),
                        ),
                        ListTile(
                          title: Text("E-mail: ${snapshot.data![Index].email}",style: TextStyles.titleListTile),
                        ),

                        Container(
                          child: Row(
                            children: [
                              Container(child: TextButton(  child: Text("Editar",style: TextStyle(color: AppColors.blue),),onPressed: (){})),
                              TextButton( child: Text("Suspender",style: TextStyle(color: AppColors.orange)),onPressed: (){}),
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
          }),
    );
  }
}
