import 'package:flutter/material.dart';



Mydrawer(String text, int _selectedIndex, IconData? icons, ontap) {
  return ListTile(
    leading: Icon(icons),
    title: Text(text),
    selected: _selectedIndex == _selectedIndex,
    onTap: ontap(),
  );
}
