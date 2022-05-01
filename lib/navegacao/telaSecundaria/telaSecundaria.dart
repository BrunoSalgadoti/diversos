import 'package:flutter/material.dart';


class telaSecundaria extends StatefulWidget {
  const telaSecundaria({Key? key}) : super(key: key);

  @override
  _telaSecundariaState createState() => _telaSecundariaState();
}

class _telaSecundariaState extends State<telaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.green,
      ),

      body: Container(
        padding: EdgeInsets.all(32),

        child: Column(

          children: <Widget> [

            Text("Tela Secundária")

          ],

        ),

      ),

    );
  }
}
