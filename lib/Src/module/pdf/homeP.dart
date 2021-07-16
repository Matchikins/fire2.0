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

    page.graphics.drawImage(PdfBitmap( await _readImageData("contosirma.jpg")),
    Rect.fromLTWH(0, 100, 300, 450));

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