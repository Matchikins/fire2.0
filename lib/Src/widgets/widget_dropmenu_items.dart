
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuItems extends StatelessWidget {

  DropMenuItems( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequerimentTypeController());
    var teste =GetRequeRequerimentType();
    return GetBuilder<RequerimentTypeController>(
        builder: (_) =>   DropdownButton<String>(
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,

          ),
          hint: Text('Selecione Um tipo'),
          onChanged: (dynamic newValue) {
            RequerimentTypeController.reqType.setSelected(newValue);
         print(RequerimentTypeController.reqType.selected);

          },
          items: RequerimentTypeController.reqType.itemMap.keys.map(( dynamic item) {
            return  DropdownMenuItem(
              value:RequerimentTypeController.reqType.itemMap[item].toString(),
              child:  Text(item),
            );
          }).toList()

        )
    );
  }
}

