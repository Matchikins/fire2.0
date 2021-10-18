
import 'package:cefops/Src/views/studantDetails/pages/page_studant_andress.dart';

import '../pages/page_forms_studants.dart';

SetStudantDetails(int pos,{context}) {
  switch (pos) {
    case 0:
      return FormsStudants() ;
    case 1:
      return StudantAndress();
  }
}