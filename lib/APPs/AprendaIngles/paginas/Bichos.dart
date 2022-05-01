import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Bichos extends StatefulWidget {
  const Bichos({Key? key}) : super(key: key);

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/ingles/");

  _executar ( String nomeAudio ) {

    _audioCache.play( nomeAudio + ".mp3");

  }
  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "cao.mp3", "gato.mp3",
      "macaco.mp3", "ovelha.mp3",
      "vaca.mp3","leao.mp3"
    ]);  }


  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return GridView.count(
      crossAxisCount: 2,
      //childAspectRatio: 1.2,  //Define o espaçamento via aspectoratio podemudar por dispositivo
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      //scrollDirection: Axis.horizontal, //Direção do Scrow do GridView

      children: <Widget>  [

        GestureDetector(
          onTap: (){
            _executar("cao");
          },
          child: Image.asset("imagens/AprendaIngles/animais/cao.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("gato");
          },
          child: Image.asset("imagens/AprendaIngles/animais/gato.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("leao");
          },
          child: Image.asset("imagens/AprendaIngles/animais/leao.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("macaco");
          },
          child: Image.asset("imagens/AprendaIngles/animais/macaco.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("ovelha");
          },
          child: Image.asset("imagens/AprendaIngles/animais/ovelha.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("vaca");
          },
          child: Image.asset("imagens/AprendaIngles/animais/vaca.png"),
        ),

      ],);
  }
}
