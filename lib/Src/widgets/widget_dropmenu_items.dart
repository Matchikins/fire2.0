
import 'package:cefops/Src/controller/requeriment_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuItems extends StatelessWidget {
  var item=['Req'];

  DropMenuItems(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RequerimentViewController());
    return GetBuilder<RequerimentViewController>(

        builder: (_) =>  DropdownButton<String>(
          value: controller.Req,
          hint: Text("Selecione Um Item"),

          onChanged: (String? newValue) {
            controller.ReqSet(newValue);
          },
          items: item
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

