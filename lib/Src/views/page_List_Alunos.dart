
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/model/model_Aluno.dart';
import 'package:cefops/Src/repository/AlunoRepositrory.dart';
import 'package:cefops/Src/views/widgets/background.dart';
import 'package:flutter/material.dart';

class ListUSers extends StatefulWidget {
  const ListUSers({Key? key}) : super(key: key);

  @override
  _ListUSersState createState() => _ListUSersState();
}

class _ListUSersState extends State<ListUSers> {
  late Future<AlunoModel> futureAluno;



  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return backgroundColor(
        size.width,
       size.height,
       FutureBuilder(
          future: fetchAlunos(),
          builder: (BuildContext context, AsyncSnapshot <List<AlunoModel>> snapshot) {
            if(snapshot.hasData){


              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder:( BuildContext context,int Index){
                    return ExpansionTile(
                      title: Container(
                        child:Row(
                          children: [
                            Text(snapshot.data![Index].name+ " "+snapshot.data![Index].lastName),

                        Container(
                          child: Row(
                            children: [
                              TextButton( child: Text("Editar"),onPressed: (){}),
                              TextButton( child: Text("Suspender"),onPressed: (){}),
                              TextButton( child: Text("Deletar"),onPressed: (){}),

                            ],
                          ),
                        )
                      ],

                    )));
                  }
              );
            }else if(snapshot.hasError){

              return Container(

                child: Text("Erro ao buscar dados"+snapshot.error.toString()),
              );
            }else{

              return Center(child: CircularProgressIndicator(
                  color: AppColors.blue,
                  backgroundColor: AppColors.orange
              ),);
            }
          }
      ), );
  }
}
