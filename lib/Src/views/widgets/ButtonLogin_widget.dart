
import 'package:flutter/material.dart';
import 'navegationHome_widget.dart';

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


      if (_formKey.currentState!.validate()) {

        Navigator.push(
            context,
            MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return MyApp();
              },
              fullscreenDialog: true,
            )
        );


      } else {}
    },
  );
}

