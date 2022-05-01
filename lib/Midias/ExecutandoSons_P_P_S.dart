import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class ExecutandoSons_P_P_S extends StatefulWidget {
  const ExecutandoSons_P_P_S({Key? key}) : super(key: key);

  @override
  _ExecutandoSons_P_P_SState createState() => _ExecutandoSons_P_P_SState();
}

class _ExecutandoSons_P_P_SState extends State<ExecutandoSons_P_P_S> {

//--------------EXECUTANDO SONS APARTIR DO PROJETO------------------------------

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executar() async {

    audioPlayer.setVolume(volume);

    if ( primeiraExecucao ){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }
  }

  _pausar ( ) async {

    int resulado = await audioPlayer.pause();
    if ( resulado == 1 ){
      //sucesso
    }
  }

  _parar () async {

    int resulado = await audioPlayer.stop();
    if ( resulado == 1 ){
      //sucesso
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Executando Audio - com botões"),
      ),

      body: Column(

        children: <Widget> [
// ----------------Slayder manipulação de volume do player----------------------
          Slider(
              value: (volume),
              min: 0,
              max: 1,
              //divisions: 10,
              onChanged: ( novoVolume ){

                setState(() {
                volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget> [

              Padding(
                padding: EdgeInsets.all(16),

                child: GestureDetector(
                  onTap: (){
                    _executar();
                  },
                  child: Image.asset("assets/imagens/executar.png"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),

                child: GestureDetector(
                  onTap: (){
                    _pausar();
                  },
                  child: Image.asset("assets/imagens/pausar.png"),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),

                child: GestureDetector(
                  onTap: (){
                    _parar();
                  },
                  child: Image.asset("assets/imagens/parar.png"),
                ),
              )
            ],)
        ],),
    );
  }
}