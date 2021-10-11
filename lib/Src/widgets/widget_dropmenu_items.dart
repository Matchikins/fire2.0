
import 'package:cefops/Src/controller/requerimentTypeController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuItems extends StatelessWidget {

  DropMenuItems( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequerimentTypeController());
    return GetBuilder<RequerimentTypeController>(
        builder: (_) =>   DropdownButton<String>(
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          hint: Text('Select City'),
          onChanged: ( newValue) {

            controller.setSelected(newValue);
            controller.update();

          },
          value: controller.selected.value,
          items: RequerimentTypeController.reqType.items.map((item) {

            return  DropdownMenuItem(
              child:  Text(item['name']),
              value: item['name'].toString(),

            );
          }).toList()

        )
    );
  }
}

