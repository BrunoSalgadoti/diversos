import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class ExecutandoSons extends StatefulWidget {
  const ExecutandoSons({Key? key}) : super(key: key);

  @override
  _ExecutandoSonsState createState() => _ExecutandoSonsState();
}

class _ExecutandoSonsState extends State<ExecutandoSons> {

//--------------EXECUTANDO SONS APARTIR DO PROJETO------------------------------

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");

  _executar() async {

    audioPlayer = await audioCache.play("bach.mp3");

  }
//------------------------------------------------------------------------------

/*--------------EXECUTANDO SONS APARTIR DA WEB ---------------------------------

  AudioPlayer audioPlayer = AudioPlayer();

  // import 'package:audioplayers/audioplayers.dart';

  _executar() async {

    //OBS: Para ter compactibilidade com o IOS precisa ser inserido os códigos abaixo em:
    //No projeto: pasta 'ios\Runner\info.plist (copiar loga abaixo do primeiro <dict>)
    //CODIGO:
/*
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
*/
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3";
    int resultado = await audioPlayer.play(url);
    if ( resultado == 1){
      //sucessso
    }
  }
*///----------------------------------------------------------------------------


  @override
  Widget build(BuildContext context) {

    _executar();
    return Container();
  }
}
