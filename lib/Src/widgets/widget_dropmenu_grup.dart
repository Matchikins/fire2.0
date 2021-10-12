
import 'package:cefops/Src/controller/requeriment_view_controller.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuGrup extends StatelessWidget {
  var grupo=['Secretaria'];

   DropMenuGrup(this.grupo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequerimentViewController());
    return GetBuilder<RequerimentViewController>(

        builder: (_) =>  DropdownButton<String>(
          value: controller.grup,
          hint: Text("Selecione Um Grupo"),

          onChanged: (String? newValue) {
            controller.GrupSet(newValue);

          },

          items: grupo
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
}

