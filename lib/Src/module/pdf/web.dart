import 'package:universal_html/html.dart';
import 'dart:convert';



Future <void>saveAndLaunche(List<int> bytes, String fileName) async{
AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
  ..setAttribute("download", fileName)..click();
}