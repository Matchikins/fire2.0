import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/navigatorController.dart';
import 'package:cefops/Src/model/adm/RequerimentModel.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  late Future<RequerimentModel> futureRequerimt;
  var mostrar = true;

  @override
  void initState() {
    MenuDescicion(UserController.user.role.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          child: FutureBuilder(
              future: GetAllRequeriment(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RequerimentModel>> snapshot) {
                print(snapshot.error);

                if (mostrar == true) {
                  return Row(
                    children: [

                      Container(
                        margin: EdgeInsets.only(left: size.width / 5),
                        width: size.width / 2,
                        height: size.height*0.01,
                        alignment: Alignment.topCenter,
                        child: LinearProgressIndicator(
                          backgroundColor: AppColors.secondary,
                          color: AppColors.primary,
                          value: 0.01,
                          semanticsValue: "1555",
                        ),
                      ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.09),
                              width: size.width / 6,
                              height: size.height*0.3,
                              child: Localizations.override(
                                context: context,
                                locale: Locale('pt'),
                                child: SfCalendar(
                                  view: CalendarView.month,
                                ),
                              ),
                            ),

                    ],
                  );
                } else if (snapshot.hasData) {
                  return Container(
                    child: Row(
                      children: [
                        GetStudants()
                      ],
                    )
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.blue,
                        backgroundColor: AppColors.orange),
                  );
                }
              })),
    );
  }
}
