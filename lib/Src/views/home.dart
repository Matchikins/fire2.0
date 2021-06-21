import 'package:cefops/Src/models/postesModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


int _selectedIndex = 0;

GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey<ScaffoldState>();
const int iconColor = 0xff15355C;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _Scaffoldkey,
      body: Container(
          child: Column(
        children: [
          Center(
            child: Text(
              "Bem Vindo",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
          ),
          Container(
            color: Colors.red,
            child:Text("Essas são as Novidades da Almedida") ,
          ),
          Container(
            width: MediaQuery.of(context).size.height/3,
            color: Colors.red,
          child:Text("", style: TextStyle(fontSize: 22),textAlign: TextAlign.end,) ,
          ),
        ],
      )),
    );
  }
}
