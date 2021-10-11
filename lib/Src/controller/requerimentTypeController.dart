
import 'package:get/get.dart';

class RequerimentTypeController extends GetxController{
  static RequerimentTypeController reqType=RequerimentTypeController();

  var nome="".obs;
  var id="".obs;
  var selected="Segunda via Certificado".obs;
  var items=[];

  setItems(List data){
    items=data;
    update();

  }
setSelected(value){
  selected=value;
  update();
}

}