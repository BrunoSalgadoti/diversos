import 'package:flutter/material.dart';

class youTube_AppBar extends StatefulWidget {

  @override
  _youTube_AppBarState createState() => _youTube_AppBarState();
}

class _youTube_AppBarState extends State<youTube_AppBar> {
  @override
  Widget build(BuildContext context) {

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
        
      ),


    );
  }
}
