import 'package:cefops/Src/model/aluno/AlunoModel.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUSers extends StatefulWidget {
  const ListUSers({Key? key}) : super(key: key);

  @override
  _ListUSersState createState() => _ListUSersState();
}

class _ListUSersState extends State<ListUSers> {

  @override
  Widget build(BuildContext context) {

    return Container(
          child: GetStudants(),
    );
  }
}
