
import 'package:get/get.dart';

class RequerimentTypeController extends GetxController{
  static RequerimentTypeController reqType=RequerimentTypeController();

  var nome="".obs;
  var id="".obs;
  String selected="";
  var items=[];
  Map<int,String> itemMap={
    1:"nada"
  };


  setItems(List data){
    items=data;
    for(var item in data){
      itemMap[item['id']]=item["name"];
    }
    update();


  }


setSelected(value){
  selected=value;
  update();
  print("oiiiiiiiiiiiiiiiiiiiiiiiii");
  print(value);

}

}