import 'package:cefops/Src/views/Notes.dart';
import 'package:cefops/Src/views/drawer_Widget.dart';
import 'package:cefops/Src/views/meuPerfil.dart';
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
    var space = MediaQuery.of(context).size.height * 0.02;
    var space_wid = MediaQuery.of(context).size.height * 0.12;
    var space_wid_Logo = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      key: _Scaffoldkey,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        backgroundColor: Color(iconColor),
        actions: <Widget>[
          Center(
            child: Image.asset("assets/images/Logo_Digital.png"),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            color: Colors.red,
          )),
          SizedBox(
            height: space,
          ),
          ListTile(
            title: Text("Meu Perfil"),
            selected: 1 == selectedIndex,
            leading: Icon(
              Icons.account_circle,
              color: Color(iconColor),
            ),
            onTap: () {
              _onSelectItem(1);
            },
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: space,
          ),
          ListTile(
            title: Text("Meu Perfil"),
            selected: 2 == selectedIndex,
            leading: Icon(
              Icons.account_circle,
              color: Color(iconColor),
            ),
            onTap: () {
              _onSelectItem(2);
            },
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: space,
          ),
          ListTile(
            title: Text("Minhas Notas"),
            selected: 3 == selectedIndex,
            leading: Icon(
              Icons.calendar_view_month,
              color: Color(iconColor),
            ),
            onTap: () {
              _onSelectItem(3);
            },
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: space,
          ),
          Center(
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.assignment),
                  SizedBox(
                    width: space_wid,
                  ),
                  Text("Requerimentos"),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: space,
          ),
          Center(
            child: FlatButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.exit_to_app_outlined),
                  SizedBox(
                    width: space_wid,
                  ),
                  Text("Sair"),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      )),
      body: _getDrawerItem(_selectedIndex),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 1:
        return PerfilHome();
      case 2:
        return NotesPage();
      case 3:
        return NotesPage();
    }
  }

  _onSelectItem(int index) {
    setState(() => selectedIndex = index);
    print(selectedIndex);
    Navigator.of(context).pop();
  }
}
