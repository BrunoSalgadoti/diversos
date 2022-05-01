import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class entrada_dados extends StatefulWidget {
  const entrada_dados({Key? key}) : super(key: key);

  @override
  _entrada_dadosState createState() => _entrada_dadosState();
}

class _entrada_dadosState extends State<entrada_dados> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text(
            "Entrada de Dados"

        ),
        backgroundColor: Colors.brown,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget> [
          Padding(
            padding: EdgeInsets.all(32),

            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText:
                "Digite um valor",
              ),
              //EXEMPLO DE COMANDOS PARA (TEXTFIELD)
              //enabled: true,
              maxLength: 2,
              //obscureText: false,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),

              // exemplos de captura de campos


                  /*onChanged: (String texto){
                    print("Valor digitado: " + texto);
                  },
              */

              onSubmitted: (String texto){
                print("Valor digitado: " + texto);
              },
              controller: _textEditingController,
            ),
          ),

          RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              color: Colors.brown,

              onPressed:(){
                print("Valor digitado: " + _textEditingController.text);
              }
          ),
        ],
      ),
    );
  }
}
