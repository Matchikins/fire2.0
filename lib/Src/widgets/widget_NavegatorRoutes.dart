import 'dart:io';

import 'package:cefops/Src/views/admLvl1/page_FinanceStatus.dart';
import 'package:cefops/Src/views/admLvl1/page_List_Alunos.dart';
import 'package:cefops/Src/views/admLvl1/page_RequeriStatus.dart';
import 'package:cefops/Src/views/admLvl1/page_SiginStudant.dart';
import 'package:cefops/Src/views/admLvl1/page_editNews.dart';
import 'package:cefops/Src/views/page_Home.dart';
import 'package:cefops/Src/views/studants/page_Course.dart';
import 'package:cefops/Src/views/studants/page_Requeriment.dart';
import 'package:cefops/Src/views/studants/page_Socre.dart';

getDrawerItem(int pos,{context}) {
  switch (pos) {
    case 0:
      return HomePage();
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
      return EditNews();
    case 7:
      return RequerimentStatus();
    case 8:
      return FinancePage();
    case 9:
      return exit(0);
    case 8:
      return exit(0);
  }
}