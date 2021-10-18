

import 'package:cefops/Src/views/admLvl1/page_Studant_Details.dart';
import 'package:cefops/Src/views/admLvl1/page_studant_infos.dart';
import 'package:cefops/Src/views/admLvl1/page_studant_notes.dart';

SetStudantPage(int pos,{context}) {
  switch (pos) {
    case 0:
      return ViewInfoFromStudant();
    case 1:
      return ViewInfoNotesStudant();
  }
}