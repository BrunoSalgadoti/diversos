import 'package:brn_apps_aulas/APPs/youtube/Player_Youtube.dart';
import 'package:brn_apps_aulas/APPs/youtube/model/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:brn_apps_aulas/APPs/youtube/Api_Alta.dart';


class emalta extends StatefulWidget {

  String pesquisa;
  emalta(this.pesquisa);

  @override
  _emaltaState createState() => _emaltaState();
}

class _emaltaState extends State<emalta> {

  _listarVideosalta(String pesquisa) {

    Api_Alta api_alta = Api_Alta();
    return api_alta.pesquisar( pesquisa );
  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Video>?>(
        future: _listarVideosalta( widget.pesquisa),
        builder: (context, snapshot){

          switch( snapshot.connectionState){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active :
            case ConnectionState.done :
              if(snapshot.hasData){

                return ListView.separated(
                  padding: EdgeInsets.only(bottom: 50),
                  itemBuilder: (context, index){

                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => Player_Youtube(videoId: video.id,)
                            ));

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage( video.imagem),
                                )
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(bottom: 20),
                            title:  Text(video.titulo + "\n",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            subtitle: Text( video.descricao,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.justify,
                            ),),

                        ],),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 3,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data!.length,
                );

              }else{

                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
          }
        }
    );

    //Ativar o container para visualização do Youtube_API.dart
    //primeiro exemplo da aula
    /*
      Container(
      child: Center(
        child: Text(
          "Exibição Inicial",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ); */
  }
}
