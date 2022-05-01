import 'package:brn_apps_aulas/APPs/youtube/CustomSearchDelegate.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/biblioteca.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/emalta.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/inicio.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/inscricoes.dart';
import 'package:flutter/material.dart';


class youTube_Api extends StatefulWidget {

  @override
  _youTube_ApiState createState() => _youTube_ApiState();
}

class _youTube_ApiState extends State<youTube_Api> {

  int  _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
       inicio(_resultado),
       emalta(_resultado),
       inscricao(),
       biblioteca(),
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 153, 163, 1),
        iconTheme: IconThemeData(
          color:  Colors.white,
          // opacity: 0.7,
        ),

        title: Image.asset(
          "imagens/youTube/youtube.png",
          width: 98,
          height: 22,
        ),

        actions: [

         /*
          IconButton(
            onPressed: (){
              print("Ação ICONCAM");
            },
            icon: Icon( Icons.videocam),
          ),
        */

          IconButton(
            icon: Icon( Icons.search),
            onPressed: () async {
             String? res = await showSearch(context: context,
                 delegate: CustomSearchDelegate());
             setState(() {
               _resultado = res!;
             });
             print("Resultado: digitado" + res!);
            },

          ),

          /*
          IconButton(
            onPressed: (){
              print("Ação ACCOUNT_CIRCLE");
            },
            icon: Icon( Icons.account_circle),
          ),
          */
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        color: Color(0xff353535),
        child: telas[_indiceAtual],
      ),

      bottomNavigationBar: BottomNavigationBar(

          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
          },


          //Para mais de 3 Botões usar linha abaixo para manter a cor de fundo----

          type: BottomNavigationBarType.fixed,

          //----------------------------------------------------------------------

          // Tipo SHIFTING muda a cor de fundo conforme o clique nos botões ------
          /*OBS: pra issso é necesário em cada botão colocar backgroundColor e
        configurar o comando abaixo:

         currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
                CRIAR VARIAVEL PARA _indiceAtual = (int  _indiceAtual = 0;

        */

          //type: BottomNavigationBarType.shifting,
          backgroundColor: Color.fromRGBO(158, 153, 163, 1),
          fixedColor: Colors.white,

          items: [

            BottomNavigationBarItem(
                backgroundColor: Color.fromRGBO(158, 153, 163, 1),
                label: "Inicio",
                icon: Icon(Icons.home,
                  color: Colors.greenAccent,
                )
            ),

            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                label:'Em Alta',
                icon: Icon(Icons.whatshot,
                  color: Colors.red,
                )
              // color: Colors.red,)
            ),

            BottomNavigationBarItem(
                backgroundColor: Colors.cyan,
                label: 'Inscrições',
                icon: Icon(Icons.subscriptions,
                  color: Colors.deepPurple,
                )
            ),

            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                label: 'Biblioteca',
                icon: Icon(Icons.folder,
                  color: Color(0xffffda6e),
                )
            ),

          ]),
    );
  }
}
