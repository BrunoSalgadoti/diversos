import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Vogais extends StatefulWidget {
  const Vogais({Key? key}) : super(key: key);

  @override
  _VogaisState createState() => _VogaisState();
}

class _VogaisState extends State<Vogais> {

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/ingles/");

  _executar ( String nomeAudio ) {

    _audioCache.play( nomeAudio + ".mp3");

  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "A.mp3", "B.mp3",
      "C.mp3", "D.mp3",
      "E.mp3","F.mp3"
    ]);  }

  @override
  Widget build(BuildContext context) {

    return  GridView.count(
      crossAxisCount: 2,
      //childAspectRatio: 1.2,  //Define o espaçamento via aspectoratio podemudar por dispositivo
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      //scrollDirection: Axis.horizontal, //Direção do Scrow do GridView

      children: <Widget>  [

        GestureDetector(
          onTap: (){
            _executar("A");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/A.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("B");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/B.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("C");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/C.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("D");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/D.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("E");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/E.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("F");
          },
          child: Image.asset("imagens/AprendaIngles/vogais/F.png"),
        ),

      ],);

  }
}
