import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_Alert.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}
int aberto=statusApp.status.requerimentosAberto.value;
class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width / 2,
              height: size.height * 0.01,
              margin: EdgeInsets.only(left: 60),
              child: LinearProgressIndicator(
                value: 0.01,
                backgroundColor: AppColors.secondary,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.24,
                    color: Colors.white70,
                    height: size.height * 0.85,
                    child: Column(
                      children: [
                        Center(
                          child:  Text(
                            "Requerimentos Aberto ${statusApp.status.requerimentosAberto}",
                            style: TextStyles.titleListTile,
                          ),
                        ),
                        Container(
                          height: size.height / 2,
                          child: GetRequeriments(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.24,
                    color: Colors.white70,
                    height: size.height * 0.85,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Requerimentos Em andamento",
                            style: TextStyles.titleListTile,
                          ),
                        ),
                        Container(
                          height: size.height / 2,
                          child: GetRequerimentsAndando(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.24,
                    color: Colors.white70,
                    height: size.height * 0.85,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Requerimentos Concluídos",
                            style: TextStyles.titleListTile,
                          ),
                        ),
                        Container(
                          height: size.height*0.8,
                          child: GetRequerimentsConcluido(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height*0.8,
                    width: size.width / 5,
                    child: Column(
                      children: [
                        Localizations.override(
                          context: context,
                          locale: Locale('pt'),
                          child: SfCalendar(
                            view: CalendarView.month,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var now=DateTime.now();
          print(now);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
