import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brn_apps_aulas/navegacao/Cara_Coroa/tela_Resultado.dart';

class Home_CaraCoroa extends StatefulWidget {

  @override
  _Home_CaraCoroaState createState() => _Home_CaraCoroaState();
}

class _Home_CaraCoroaState extends State<Home_CaraCoroa> {

  void _resultado (){

    var escolha = ["cara", "coroa"];
    var numeros = Random().nextInt(escolha.length);
    var escolhido = escolha[numeros];

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => tela_Resultado(escolhido)
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd8c),


      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget> [

            Image.asset("imagens/cara_coroa/logo.png"),

            GestureDetector(
                onTap: _resultado,
                child:  Image.asset("imagens/cara_coroa/botao_jogar.png")
            )

          ],),
      ),
    );
  }
}

