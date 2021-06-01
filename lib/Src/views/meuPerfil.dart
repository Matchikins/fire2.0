import 'package:flutter/material.dart';

class PerfilHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Text(
                  "Meu Perfil",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  InfoComplete("Nome: Emison", 33),
                  SizedBox(
                    width: 30,
                  ),
                  InfoComplete("Sobrenome: Dias", 33),
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              child: Row(
                children: [
                  InfoComplete("Telefone: 81 8144657711", 33),
                  SizedBox(
                    width: 30,
                  ),
                  InfoComplete("Nacionalidade: Brasil ", 33),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget InfoComplete(String text, double size) {
  return Container(
    child: Text(
      text,
      style: TextStyle(fontSize: size),
    ),
    alignment: Alignment.bottomLeft,
  );
}
