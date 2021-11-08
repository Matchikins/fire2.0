import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Pagina para visualizar As financias internas
class InternalFinance extends StatelessWidget {
  ///inicio
  const InternalFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(children:<Widget> [
            Center(
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: Get.width/2,
                height: Get.height*0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.amber,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepOrangeAccent,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.green,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.orange,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),

              ),
            )

          ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: Get.height * 0.94,
                      width: Get.width / 6,
                      color: AppColors.secondaryDark,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        height: Get.height*0.94,
                        width: Get.width*0.58,
                        color: AppColors.primaryDark,

                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: Get.height * 0.94,
                      width: Get.width / 4,
                      color: AppColors.secondaryDark,
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        child: const Icon(Icons.add),
        onPressed: () {  },),
    );
  }
}
