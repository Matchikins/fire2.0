import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/adm/RequerimentModel.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

GetRequeriments() {
  return FutureBuilder(
      future: GetAllRequeriment(),
      builder: (BuildContext context,
          AsyncSnapshot<List<RequerimentModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int Index) {
                var now = snapshot.data![Index].abertoEm;
                var formatter = new DateFormat(" d'/'MM'/'y 'as' hh:mm");
                var previsaoFormater =
                    DateFormat("'Previsão de Entrega:' dd/MM/yyyy").format(
                        now.add(Duration(
                            days: snapshot.data![Index].tipo.diasPentregar)));
                String formatted = formatter.format(now);
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![Index].tipo.name,
                          style: TextStyles.titleListTile,
                        ),
                        Text(
                          "Nome: ${snapshot.data![Index].aluno.name + " " + snapshot.data![Index].aluno.lastName}",
                          style: TextStyles.titleListTile,
                        ),
                        Container(
                          height: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Aberto Em:$formatted"),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))
                            ],
                          ),
                        ),
                        Text(previsaoFormater),
                        Center(
                          child: Container(
                            color: Colors.green,
                            width: 40,
                            height: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
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

GetRequerimentsAndando() {
  return FutureBuilder(
      future: GetAllRequeriment(),
      builder: (BuildContext context,
          AsyncSnapshot<List<RequerimentModel>> snapshot) {
        if (snapshot.hasData) {
       List<RequerimentModel> test=[];
       test=snapshot.data!.toList();

      var filter= test.where((u) => u.status=='andando').toList();


          return ListView.builder(
              itemCount: filter.length,
              itemBuilder: (BuildContext context, int Index) {
                var now = filter[Index].abertoEm;
                var formatter = new DateFormat(" d'/'MM'/'y 'as' hh:mm");
                var previsaoFormater =
                DateFormat("'Previsão de Entrega:' dd/MM/yyyy").format(
                    now.add(Duration(
                        days: snapshot.data![Index].tipo.diasPentregar)));
                String formatted = formatter.format(now);
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![Index].tipo.name,
                          style: TextStyles.titleListTile,
                        ),
                        Text(
                          "Nome: ${snapshot.data![Index].aluno.name + " " + snapshot.data![Index].aluno.lastName}",
                          style: TextStyles.titleListTile,
                        ),
                        Container(
                          height: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Aberto Em:$formatted"),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))
                            ],
                          ),
                        ),
                        Text(previsaoFormater),
                        Center(
                          child: Container(
                            color: Colors.green,
                            width: 40,
                            height: 4,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
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
