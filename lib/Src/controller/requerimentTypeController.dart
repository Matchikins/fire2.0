
import 'package:get/get.dart';

class RequerimentTypeController extends GetxController{
  static RequerimentTypeController reqType=RequerimentTypeController();

  var nome="".obs;
  var id="".obs;
  String selected="";
  var items=[];
  Map<String,int> itemMap={};
  setItems(List data){
    items=data;
    for(var item in data){
      itemMap[item['name']]=item["id"];
    }
    update();

  }

setSelected(value){
  selected=value;
  update();

}

}