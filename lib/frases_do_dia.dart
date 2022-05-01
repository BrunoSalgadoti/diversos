import 'package:flutter/material.dart';

class frases_do_dia extends StatefulWidget {
  const frases_do_dia({Key? key}) : super(key: key);

  @override
  _frases_do_diaState createState() => _frases_do_diaState();
}

class _frases_do_diaState extends State<frases_do_dia> {


  get child => null;

  @override
  Widget build(BuildContext context) {
     return Container(


      padding: EdgeInsets.fromLTRB(30, 10, 30, 2),
      margin: EdgeInsets.only(top:30),

      decoration:
      BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.red)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget> [
          FlatButton(
            onPressed: (){
              print("Botão Pressionado!");
            },
            child: Text(
              "Clique Aqui",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrange,
                decoration: TextDecoration.none,
              ),
            ),
          ),

          Text(
              "\n"
                  "Lorem Ipsum" ,
              style: TextStyle(
                fontSize: 33,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 5,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.black,
                color: Colors.blue,
              )
          ),

          Text (
              "\n"
                  "É simplesmente uma simulação de texto da indústria tipográfica"
                  " e de impressos, e vem sendo utilizado desde o século XVI, quando"
                  " um impressor desconhecido pegou uma bandeja de tipos e os embaralhou"
                  " para fazer um livro de modelos de tipos.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 5,
                decoration: TextDecoration.none,
                color: Colors.black,
              )
          ),
        ],
      ),
    );
  }
}

