import 'package:cefops/Src/models/postesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_connect_controller.dart';

class GetConnectPage extends GetView<GetConnectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final postModels item = state[index];
            return ListTile(
              title: Text(item.name.toString()),
              subtitle: Text('Quantidade de types: '),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error!),
              TextButton(
                onPressed: () => controller.findUsers(),
                child: Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
