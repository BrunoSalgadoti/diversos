import 'package:flutter/material.dart';

class frases_do_dia_imagens extends StatefulWidget {
  const frases_do_dia_imagens({Key? key}) : super(key: key);

  @override
  _frases_do_dia_imagensState createState() => _frases_do_dia_imagensState();
}

class _frases_do_dia_imagensState extends State<frases_do_dia_imagens> {

  var _titulo = "Instagram";
  var _nome = "Aluno: Bruno de Pádua";


  @override
  Widget build(BuildContext context) {

    print("Buid Chamado");

    return Scaffold(

      appBar: AppBar (
        title:Text(_titulo),
        backgroundColor: Colors.lightBlueAccent,
      ),

      body: Padding(
          padding: EdgeInsets.all(50),
          child: Column (
            children: <Widget>[
              Text(
                "Aula Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  decoration:
                  TextDecoration.none,
                  color: Colors.black12,
                ),
              ),

              RaisedButton(
                onPressed: (){
                  setState(() {
                    _nome = "curso Fluter";
                    print("Texto Clicado");
                  });

                },
                color: Colors.red,
                child: Text("Inscreva-se"),
              ),

              Text("nome: $_nome"),

            ],
          )

      ),




      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Row(
            children: <Widget> [
              Text("Aula Fluter 1º APP - Frases do dia"),
            ],

          ),
        ),
      ),
    );
  }
}
