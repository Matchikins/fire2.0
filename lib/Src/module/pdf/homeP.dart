import 'dart:typed_data';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/module/pdf/http/itemmodel.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import  'mobile.dart' if(dart.library.html)"web.dart";

class pdfHome extends StatefulWidget {
  const pdfHome({Key ?key}) : super(key: key);



  @override
  _pdfHomeState createState() => _pdfHomeState();
}
late Future<ItemModel> futureAluno;

class _pdfHomeState extends State<pdfHome> {
   final  dia = new DateTime.now() ;
   bool isloading=false;
  final textControl=TextEditingController();
  @override
  Widget build(BuildContext context) {
  final size= MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(

          children: [
            SizedBox(
              height: size.height*0.4,
            ),
            Container(
              width: size.width/2,

              child: TextFormField(
                controller:textControl ,

              ),
            ),
            ElevatedButton(

              child:isloading ? CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.amber,
              ): Text("Gerar PDf"),
                onPressed: (){
                    setState(() {
                      isloading=true;
                    });
                  Future.delayed(Duration(milliseconds: 800), () {
                    print(textControl.text);

                    _pdfCreate();

                    setState(() {
                      isloading=false;

                    });

                  });





                },
            ),
          ],
        )
      ),
    );
  }
  Future<void> _pdfCreate() async{

    isloading = false;

    var timeformat = DateFormat(" dd/MM/yyyy  hh:mm").format(dia);
    var timeformat2 = DateFormat(" dd/MM/yyyy  ").format(dia);

    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString("Escola De Enfermagem Almeida Santos Itaquera",
        PdfStandardFont(PdfFontFamily.timesRoman, 14),
        bounds: Rect.fromLTWH(0, 40, 400, 90),);
    page.graphics.drawString("ATESTADO DE MATRÍCULA",
        PdfStandardFont(PdfFontFamily.timesRoman, 12),
        bounds: Rect.fromLTWH(0, 80, 400, 120),);
    page.graphics.drawString("ATESTO, atendendo o requerimento do(a) interessado(a),"
        " que ${UserController.user.name} ${UserController.user.lastName},inscrito(a) no  ",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 120, 600, 120),);
    page.graphics.drawString("CPF sob o nº ${UserController.user.id.toString()}, é aluno(a) regularmente matriculado(a) no Curso de (informar),",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 138, 600, 120),);
    page.graphics.drawString("ministrado pelo Departamento de (informar), cursando o (informar) semestre no período (noturno),",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 156, 600, 120),);
    page.graphics.drawString("devendo cumprir a carga horária total de (informar) horas, no período de (data) a (data).",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 174, 600, 120),);
    page.graphics.drawString("Informo ainda que a Escola De Enfermagem Almeida Santos Itaquera, inscrita no CNPJ",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 192, 600, 120),);
    page.graphics.drawString("sob o nº 08.347.198/0001, está situada na Rua Américo Salvador Novelli, 256 - Itaquera, São Paulo.",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 210, 600, 120),);
    page.graphics.drawString("São Paulo, ${timeformat2}. ",
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      bounds: Rect.fromLTWH(0, 228, 600, 120),);
    // page.graphics.drawImage(PdfBitmap(await _readImageData("contosirma.jpg")),
    //     Rect.fromLTWH(0, 100, 300, 450));

    // PdfGrid grid= PdfGrid();
    // grid.style= PdfGridStyle(
    //   font: PdfStandardFont(PdfFontFamily.helvetica,30),
    //   cellPadding: PdfPaddings(left: 5,right: 5,top: 5,bottom: 5)
    // );
    //
    // grid.columns.add(count: 3);
    // grid.headers.add(1);
    //
    // PdfGridRow header=grid.headers[0];
    //
    // header.cells[0].value= "Teste 1";
    // header.cells[1].value= "Teste 2 ";
    // header.cells[2].value= "Teste 3";
    //
    // PdfGridRow row=grid.rows.add();
    // row.cells[0].value="1";
    // row.cells[1].value="2";
    // row.cells[2].value="3";

    // grid.draw(page: document.pages.add(),bounds: const Rect.fromLTWH(0,0,0,0));

    page.graphics.drawString(
      " ${timeformat}",
      PdfStandardFont(PdfFontFamily.helvetica, 22),
      bounds: Rect.fromLTWH(323, 740, 400, 90),
    );

    List<int> bytes= document.save();
    document.dispose();
    saveAndLaunche(bytes, "Output.pdf");
    print("iniciou Com sucesso");


  }
}

Future<Uint8List> _readImageData(String name) async{
  final data =await rootBundle.load("images/$name");
  return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
}