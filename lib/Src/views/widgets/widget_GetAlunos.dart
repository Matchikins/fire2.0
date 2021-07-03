import 'package:cefops/Src/model/Aluno_Model.dart';
import 'package:cefops/Src/repository/AlunoRepositrory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
int corLaranja=0xffFD7E14;
int corAzul=0xff15355C;

class GetAlunos extends StatefulWidget {
  const GetAlunos({Key? key}) : super(key: key);

  @override
  _GetAlunosState createState() => _GetAlunosState();
}

class _GetAlunosState extends State<GetAlunos> {

  @override
  Widget build(BuildContext context) {
    return Container(
            child: FutureBuilder(
              future: fetchAlunos(),
              builder: (BuildContext context, AsyncSnapshot<List<AlunoModel>> snapshot) {
                if(snapshot.hasData){


                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder:( BuildContext context,int Index){
                    return ExpansionTile(
                        title: Container(
                          child:Row(
                            children: [
                              Text(snapshot.data![Index].name+ " "+snapshot.data![Index].lastName),
                              SizedBox(
                                width: 22,
                              ),
                              Text("Status: ${snapshot.data![Index].grupe}")
                            ],
                          ),
                        ),
                            children: [
                              ListTile(
                        title: Text("CPF: ${snapshot.data![Index].cpf}"),
                              ),
                              ListTile(
                                title: Text("E-mail: ${snapshot.data![Index].email}"),
                              ),
                              ListTile(
                                title: Text("Curso: ${snapshot.data![Index].curso}"),
                              ),
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

                    );
                }
                );
                }else if(snapshot.hasError){
                  return Container(
                    child: Text("Erro ao buscar dados"),
                  );
                }else{
                  return Center(child: CircularProgressIndicator(
                      color: Color(corAzul),
                      backgroundColor: Color(corLaranja)
                  ),);
                }
            }
            ),
    );
  }
}
