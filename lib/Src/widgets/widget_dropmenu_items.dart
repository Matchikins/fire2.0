import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuItems extends StatelessWidget {
  DropMenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _roles = RequerimentTypeController.reqType.itemMap

    return  GetBuilder<RequerimentController>(
     init: RequerimentController(),
      builder: (c) {

        return Container(
          width: 200,
            height: 100,
            padding: EdgeInsets.all(2.0),      //some padding
            child:DropdownFormField<Map<String, dynamic>>(
              onEmptyActionPressed: () async {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Access"),
              onSaved: (dynamic str) {},
              onChanged: (dynamic str) {},
              validator: (dynamic str) {},
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['name'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => _roles,
              selectedFn: (dynamic item1, dynamic item2) {
                if (item1 != null && item2 != null) {
                  return item1['name'] == item2['name'];
                }
                return false;
              },
              filterFn: (dynamic item, str) =>
              item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                  bool selected, Function() onTap) =>
                  ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                      item['desc'] ?? '',
                    ),
                    tileColor:
                    focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                    onTap: onTap,
                  ),
            ),

  );
      }
    );
  }
}
