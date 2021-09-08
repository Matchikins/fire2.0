import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/navigatorController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeesPage  extends StatefulWidget {
  const EmployeesPage ({Key? key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  void initState() {
    MenuDescicion(UserController.user.role.first);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: size.width/5),
            width: size.width/2,
            alignment: Alignment.center,
            child: LinearProgressIndicator(
              backgroundColor: AppColors.secondary,
                color: AppColors.primary,
                value: 0.01,
                semanticsValue: "1555",

              ),

          ),
          SizedBox(
            height: size.height*0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: size.width*0.65),
            width: size.width/3,
            child:SfCalendar(
              view: CalendarView.month,

            ) ,
          )
        ],
      ),
    );
  }
}
