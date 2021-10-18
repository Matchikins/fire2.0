

import 'package:cefops/Src/views/studantDetails/pages/page_studant_details-menu.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_infos.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_notes.dart';

SetStudantPage(int pos,{context}) {
  switch (pos) {
    case 0:
      return ViewInfoFromStudant();
    case 1:
      return ViewInfoNotesStudant();
  }
}