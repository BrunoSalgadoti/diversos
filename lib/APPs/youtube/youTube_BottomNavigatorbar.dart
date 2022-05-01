import 'package:brn_apps_aulas/APPs/youtube/telas/biblioteca.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/emalta.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/inicio.dart';
import 'package:brn_apps_aulas/APPs/youtube/telas/inscricoes.dart';
import 'package:flutter/material.dart';

class youTube_BottomNavigatorbar extends StatefulWidget {

  @override
  _youTube_BottomNavigatorbarState createState() => _youTube_BottomNavigatorbarState();
}

class _youTube_BottomNavigatorbarState extends State<youTube_BottomNavigatorbar> {

  int  _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      //inicio(),
      //emalta(),
      inscricao(),
      biblioteca(),
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 153, 163, 1),
        iconTheme: IconThemeData(
          color:  Colors.white,
        ),

        title: Image.asset(
          "imagens/youTube/youtube.png",
          width: 98,
          height: 22,
        ),

        actions: [

          IconButton(
            onPressed: (){
              print("Ação ICONCAM");
            },
            icon: Icon( Icons.videocam),
          ),

          IconButton(
            onPressed: (){
              print("Ação SEARCH");
            },
            icon: Icon( Icons.search),
          ),

          IconButton(
            onPressed: (){
              print("Ação ACCOUNT_CIRCLE");
            },
            icon: Icon( Icons.account_circle),
          ),
        ],
      ),

      body: Container(
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

          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(158, 153, 163, 1),
          fixedColor: Colors.white,

          items: [

            BottomNavigationBarItem(
                label: 'Inicio',
                icon: Icon(Icons.home,
                  color: Colors.greenAccent,
                )
            ),

            BottomNavigationBarItem(
                label:'Em Alta',
                icon: Icon(Icons.whatshot,
                  color: Colors.red,
                )
              // color: Colors.red,)
            ),

            BottomNavigationBarItem(
                label: 'Inscrições',
                icon: Icon(Icons.subscriptions,
                  color: Colors.deepPurple,
                )
            ),

            BottomNavigationBarItem(
                label: 'Biblioteca',
                icon: Icon(Icons.folder,
                  color: Color(0xffffda6e),
                )
            ),

          ]),
    );
  }
}

