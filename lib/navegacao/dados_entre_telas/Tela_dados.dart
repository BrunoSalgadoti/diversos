import 'package:flutter/material.dart';

class Tela_dados extends StatefulWidget {

  String valor = "";

  Tela_dados({required this.valor});

  @override
  _Tela_dadosState createState() => _Tela_dadosState();
}

class _Tela_dadosState extends State<Tela_dados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tela Secundaria: Dados Entre telas"),
        backgroundColor: Colors.green,
      ),

      body: Container(
        padding: EdgeInsets.all(32),

        child: Column(

          children: <Widget> [

            Text("Tela Secundária! Valor passado: ${widget.valor}")

          ],

        ),

      ),

    );
  }
}
