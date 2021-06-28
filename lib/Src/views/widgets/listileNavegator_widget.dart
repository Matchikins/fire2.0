import 'dart:io';
import 'package:cefops/Src/views/SocrePage.dart';
import 'package:cefops/Src/views/siginStudantPage.dart';
import 'package:cefops/Src/views/myCoursePage.dart';
import 'package:flutter/material.dart';
import '../arequerimentPage.dart';
import 'navegationHome_widget.dart';
int? _selectedIndex;
String? titulos;


menuIten(String titulo,IconData icon,int SelectedPage,context,String tituloappbar,){
  ListTile(
    title: Text(titulo),
    leading: Icon(icon),
    selected: SelectedPage == _selectedIndex,
    onTap: () {
      _onSelectItem(SelectedPage,context);
      titulos = tituloappbar;

    },
  );
}

getDrawerItem(int pos) {
  switch (pos) {

    case 1:
      return myCourse();
    case 2:
      return NotesPage();
    case 3:
      return _viwesPermission();
    case 4:
      return exit(0);
  }
}
_onSelectItem(int index, context ) {
  _selectedIndex = index;
  Navigator.of(context).pop();
}
_viwesPermission(){
  try{
    if(acessgaranted==true){
      return SiginStudant();
    } else{
      return RequeriViews();
    }
  }catch(e){
    return RequeriViews();
  }

}