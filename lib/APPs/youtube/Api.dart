import 'package:brn_apps_aulas/APPs/youtube/model/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const CHAVE_YOUTUBE_API = "";   //AulaFlutter 2 projeto
//const CHAVE_YOUTUBE_API = ""; //AulaFlutter projeto
const ID_CANAL = "UCFCiSRbCVwQ_BQaDQBYxN_A";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {

  String url = URL_BASE + "/search";

  Future<List<Video>?> pesquisar (String pesquisa) async {

    url = url + "?part=snippet"
        "&type=video"
        "&maxResults=10"
        "&order=date"
        "&key=${CHAVE_YOUTUBE_API}"

    //esta linha de comando retorna uma lista de um único canal removando
    // pesquisa em todo youtube
        //"&channelId=${ID_CANAL}"

        "&q=$pesquisa";
    //print(url);

    http.Response response = await http.get( Uri.parse(url) );

    if ( response.statusCode == 200){

      //print("CÓDIGO OK!!! SUCESSO!!!" + response.body);

      Map<String, dynamic> dadosJson = json.decode( response.body );

      List<Video> videos = dadosJson["items"].map<Video>(
              (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

      //só demonstrando o resultado no console para os títulos dos víudeos recuperados
     /* for ( var video in videos ) {
        print ("resultado:"  + video.titulo);
      }*/

      //percorrendo varios itens da lista de videos
      /* for ( var video in dadosJson["items"]){
        print ("resultado:"  + video.toString());
      }*/

      // exibindo um resultado específico de um vídeo
      // print( "resultado:" + dadosJson["items"][0]["snippet"]["title"].toString());

    }else{
      //print("ERRO NO RETORNO!!!");
      print( response.statusCode);
      //print(url);
    }



  }
}
