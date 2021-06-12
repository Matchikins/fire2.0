import 'dart:async';

import 'package:flutter/material.dart';
import '../navegacaoHome.dart';

bool isloading = false;

logginButon(context, _formKey) {
  return FlatButton(
    height: MediaQuery.of(context).size.height * 0.07,
    child: Column(
      children: [
        Text(
          'Login',
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
        ),
        if (isloading == true)
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff15355C)),
          )
      ],
    ),
    color: Color(0xffFD7E14),
    textColor: Colors.white,
    shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Color(0xff15355C), width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(7)),
    onPressed: () {
      print("apertou logar  e deu erro");
      print(isloading);
      if (_formKey.currentState!.validate()) {
        print("apertou logar e passou ");
        startTimer();
        isloading = true;
        print(isloading);


        Navigator.push(
            context,
            MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return MyApp();
              },
              fullscreenDialog: true,
            ));
      } else {}
    },
  );
}

double _progress = 0;

void startTimer() {
  new Timer.periodic(
    Duration(seconds: 1),
    (Timer timer) => () {
      if (_progress == 1) {
        timer.cancel();
      } else {
        _progress += 0.2;
      }
    },
  );
}
