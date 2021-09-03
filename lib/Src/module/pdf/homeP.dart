import 'dart:math';
import 'dart:typed_data';
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

    isloading=false;


    var timeformat =DateFormat(" dd/MM/yyyy  hh:mm").format(dia);
    PdfDocument document= PdfDocument();
    final page= document.pages.add();

    page.graphics.drawString("${textControl.text.toString()}", PdfStandardFont(PdfFontFamily.helvetica, 22));

    // page.graphics.drawImage(PdfBitmap( await _readImageData("contosirma.jpg")),
    // Rect.fromLTWH(0, 100, 300, 450));

    PdfGrid grid= PdfGrid();
    grid.style= PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica,30),
      cellPadding: PdfPaddings(left: 5,right: 5,top: 5,bottom: 5)
    );

    for(var i=0; i<=1;i++ ){
      grid.columns.add(count: i);

    }
    for(var i=0; i<=1;i++ ){
      grid.columns.add(count: i);
    }
    for(var i=0; i<=1;i++ ){
      grid.headers.add(i);
    }
    var Cabecalhos = ['Disciplinas', 'Trabalho', 'Particiáção','avaliação','exercicios',''];

    PdfGridRow header=grid.headers[0];
    Cabecalhos.forEach((element) {
      for(var i=1; i<=Cabecalhos.length;i++){
        header.cells[0].value= "${element}";
        header.cells[1].value= "nota ";

      }
    });

    var moviesTitles = ['Ginecologia', 'Obsteticia', 'Saúde Publica'];

moviesTitles.forEach((element) {
var i=1; i++;
  PdfGridRow row=grid.rows.add();
  row.cells[0].value="${element}";
  row.cells[1].value="${i*3}";
 });




    grid.draw(page: document.pages.add(),bounds: const Rect.fromLTWH(0,0,0,0));



    page.graphics.drawString(" ${timeformat}", PdfStandardFont(PdfFontFamily.helvetica, 22),
    bounds:  Rect.fromLTWH(323, 740, 400, 90),
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