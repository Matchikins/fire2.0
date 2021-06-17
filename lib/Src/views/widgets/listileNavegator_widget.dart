import 'dart:io';
import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/cadastroAlunos.dart';
import 'package:cefops/Src/views/home.dart';
import 'package:cefops/Src/views/loginPage.dart';
import 'package:cefops/Src/views/myCourse.dart';
import 'package:flutter/material.dart';
import '../arequeriment.dart';
import '../navegacaoHome.dart';
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
    case 0:
      return HomePage();
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