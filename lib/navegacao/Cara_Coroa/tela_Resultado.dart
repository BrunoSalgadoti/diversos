import 'package:flutter/material.dart';

class tela_Resultado extends StatefulWidget {

  String valor;
  tela_Resultado(this.valor);

  @override
  _tela_ResultadoState createState() => _tela_ResultadoState();
}

class _tela_ResultadoState extends State<tela_Resultado> {
  @override
  Widget build(BuildContext context) {

    //print(widget.valor);
    //Variavel para mudar a figura na tela do resultado
    var _caminhoImagem;

    if(widget.valor == "cara"){
      _caminhoImagem = "imagens/cara_coroa/moeda_cara.png";
    }else{
      _caminhoImagem = "imagens/cara_coroa/moeda_coroa.png";
    }

    return Scaffold(
      backgroundColor: Color(0xff61bd8c),

      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget> [

            Image.asset(_caminhoImagem),

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:   Image.asset("imagens/cara_coroa/botao_voltar.png"),
            )

          ],),
      ),
    );
  }
}
