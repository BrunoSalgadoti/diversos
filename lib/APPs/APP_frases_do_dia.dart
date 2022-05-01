import 'dart:math';
import 'package:flutter/material.dart';

class APP_frases_do_dia extends StatefulWidget {
  const APP_frases_do_dia({Key? key}) : super(key: key);
  @override
  _APP_frases_do_diaState createState() => _APP_frases_do_diaState();
}

class _APP_frases_do_diaState extends State<APP_frases_do_dia> {

  var _frasesGeradas = "Clique abaixo para gerar uma frase";

  var _frases = [
    "Olhe para cima. Que é de lá que vem tua força! \n Autor: Anonimo",
    "Não importa o que você decidiu. O que importa é que isso te faça feliz. \n Autor: Anonimo",
    "A força da MUDANÇA não está nas palavras e sim nas ações. \n Autor: Anonimo",
    "O que te desafia é o que te transforma. \n Autor: Anonimo",
    "A vida é igual a andar de biciclet. Para ter equilíbrio você tem que se manter em movimento... \n Autor: A. Einstein",
    "Você só vence amanhã se não desistir hoje! \n Autor: Coisas de Menina",
    "Seus sonhos não precisam de platéia, eles só precisam de você. \n Autor: Belasmensagens",
    "Difícil é escolher uma for em um jardim, Fácil é esquecer do calor de um deserto quando nele achamos uma flor! \n Autor: Bruno Salgado",
    "A vida é um constante recomeço. Não se dê por derrotado e siga adiante. As pedras que hoje atrapalham amanhã enfeitarão a sua entrada. \n Autor: frasestop.com",
    "Confiar em Deus é ter a certeza de que tudo dará certo. \n Autor: frasesdobem",
    "Procure ser uma pessoa de valor, antes de procurar ser uma pessoa de sucesso. \n Autor: Anonimo",
    "O amor é urgente. É para hoje. Para Agora... Existe risco em deixar o amor para depois, afinal, o depois pode ser tarde demais! \n Autor: 42frases.com.br",
    "Um sonho sonhado sozinho é um sonho. Um sonho sonhado junto é realidade. \n Autor: John Lennon",
    "O mundo está nas mãos daqueles que têm coragem de sonhar e de correr o risco de viver seus sonhos. \n Autor: Valerine",
    "Coragem é estar morto de medo e encilhar o cavalo mesmo assim. \n Autor: John Wayne",
    "O problema não é tropeçar. mas apegar-se à pedra. \n Autor: Anonimo",
    "Vamos olhar o agora, para não precisar refletir mais tarde. O agora já é muito tarde. \n Autor: Bruno Salgado",
    "Os problemas existem e nada é fácil, mas com força e determinação tudo se realiza. Não desista! \n Autor: Anonimo",
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado. \n Autor: Roberto Shinyashiki",
    "Imagine uma nova história para a sua vida e acredite nela. \n  Autor: Paulo Coelho"
  ];

  void _frasesAleatorias (){

    var _mostrarFrases = Random().nextInt(_frases.length);

    setState(() {
      _frasesGeradas = _frases [ _mostrarFrases ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(
            "Frases do Dia",
            //textAlign: TextAlign.center, (Porque Não Funciona)
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              decoration:
              TextDecoration.none,
              color: Colors.white,
            ),
          ),

          backgroundColor: Colors.green,

        ),

        body: Container(
          //color: Colors.white,
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amberAccent)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget> [
              Image.asset("imagens/frases_img/logo.png"),
              Text(_frasesGeradas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),

              ),

              RaisedButton(
                child: const Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    )
                ),
                color: Colors.green,
                onPressed: _frasesAleatorias,
              )
            ],
          ),
        )
    );
  }
}



