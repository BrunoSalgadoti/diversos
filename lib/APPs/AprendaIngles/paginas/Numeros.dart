import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numeros extends StatefulWidget {
  const Numeros({Key? key}) : super(key: key);

  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/ingles/");

  _executar ( String nomeAudio ) {

    _audioCache.play( nomeAudio + ".mp3");

  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "1.mp3", "2.mp3",
      "3.mp3", "4.mp3",
      "5.mp3","6.mp3"
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
            _executar("1");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/1.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/2.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/3.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/4.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/5.png"),
        ),

        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Image.asset("imagens/AprendaIngles/numeros/6.png"),
        ),

      ],);

  }
}
