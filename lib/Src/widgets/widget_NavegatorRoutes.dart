import 'dart:io';

import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/module/pdf/homeP.dart';
import 'package:cefops/Src/views/admLvl1/HomePageEmployes.dart';
import 'package:cefops/Src/views/admLvl1/page_FinanceStatus.dart';
import 'package:cefops/Src/views/admLvl1/page_List_Alunos.dart';
import 'package:cefops/Src/views/admLvl1/page_RequeriStatus.dart';
import 'package:cefops/Src/views/admLvl1/page_SiginStudant.dart';
import 'package:cefops/Src/views/admLvl1/page_editNews.dart';
import 'package:cefops/Src/views/page_Home.dart';
import 'package:cefops/Src/views/studants/page_Course.dart';
import 'package:cefops/Src/views/studants/page_Requeriment.dart';
import 'package:cefops/Src/views/studants/page_Socre.dart';
import 'package:flutter/material.dart';

getDrawerItem(int pos,{context}) {
  switch (pos) {
    case 0:
      return HomeChange();
    case 1:
      return myCourse();
    case 2:
      return NotesPage();
    case 3:
      return SiginStudant();
    case 4:
      return ListUSers();
    case 5:
      return RequeriViews();
    case 6:
      return pdfHome();
    case 7:
      return RequerimentStatus();
    case 8:
      return FinancePage();
    case 9:
      return EditNews();
  }
}

HomeChange(){
  if(statusApp.status.aluno==true){
    return HomePage();
  }
   else{
     return EmployeesPage();
  }
}
