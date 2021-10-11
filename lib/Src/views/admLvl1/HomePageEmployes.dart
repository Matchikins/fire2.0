import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requeriment_view_controller.dart';
import 'package:cefops/Src/controller/requerimentsController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:cefops/Src/widgets/widget_Alert.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
   var teste =GetRequeRequerimentType();
   return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),

        child: Container(
          height: size.height,
          child:Column(
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
                              child:  GetRequeriments(),

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

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RequerimentController.req.linkPhoto.value="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png";
          RequerimentController.req.StudantFullName.value="";
          showAlertDialog(context);


          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );

  }
}
