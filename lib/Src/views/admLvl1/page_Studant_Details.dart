
import 'package:cefops/Src/widgets/widget_aluno_detailsv2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudantDetails extends StatelessWidget {
  const StudantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: (Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector( onTap: (){
                  print("Clicou no 1");
                },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,

                    ),
                    child: Center(
                      child: Text("Info"),
                    ),
                  ),
                ),

                GestureDetector( onTap: (){
                  print("Clicou no 2");
                },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,

                    ),
                    child: Center(
                      child: Text("Notas"),
                    ),
                  ),
                ),
                GestureDetector( onTap: (){
                  print("Clicou no 3");
                },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,

                    ),
                    child: Center(
                      child: Text("Diario"),
                    ),
                  ),
                ),



              ],
            ),
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            Container(
              width: Get.width,
              height: Get.height*0.89,
              decoration: BoxDecoration(
                color:Colors.white,
              ),
            )
          ],
        )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AlunoDetails(context);
        },

      ),
    );
  }
}
