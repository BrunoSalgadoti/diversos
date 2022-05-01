import 'package:flutter/material.dart';

class secundaria_rotas extends StatefulWidget {

  String valor = "";

  secundaria_rotas({required this.valor});

  @override
  _secundaria_rotasState createState() => _secundaria_rotasState();
}

class _secundaria_rotasState extends State<secundaria_rotas> {
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

            Text("Tela Secundária!"),

            ElevatedButton(
              onPressed: (){
                Navigator.popAndPushNamed(
                    context,
                    "/"
                );
              },

              child: const Text(
                "Ir para a primeira Tela",
                style: TextStyle(
                  fontSize: 20,
                  decorationColor: Colors.black,
                ),
              ),

              //ElevatedButton CUSTOMIZAÇÃO

              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 15,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

          ],

        ),

      ),

    );
  }
}
