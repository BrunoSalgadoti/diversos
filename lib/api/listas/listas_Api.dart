import 'package:brn_apps_aulas/api/listas/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class listas_Api extends StatefulWidget {
  const listas_Api({Key? key}) : super(key: key);

  @override
  _listas_ApiState createState() => _listas_ApiState();
}

class _listas_ApiState extends State<listas_Api> {

  String urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {


    Uri _url = Uri.parse(urlBase + "/posts");
    http.Response response = await http.get(_url);
    var dadosJson = json.decode( response.body );

    List<Post> postagens = [];

    for (var post in dadosJson) {
      //print("Post: " + post["title"]);
      Post p = Post(post["userId"],post["id"],post["title"],post["body"]);
      postagens.add( p );
    }

    return postagens;
    //print( postagens.toString() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),

      body: FutureBuilder<List<Post>>(

        future: _recuperarPostagens(),
        builder: (context, snapshot){

          switch( snapshot.connectionState ){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if ( snapshot.hasError ){
                return Text("Erro ao carregar");
                //print("Lista: Erro ao carregar ");
              }else {
                //print("Lista Carregou!!");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {

                      List<Post> lista = snapshot.data!;
                      Post post = lista[index];

                      return ListTile(
                        title: Text( post.title ),
                        subtitle: Text( post.id.toString() ),
                      );
                    }
                );
              }
          }
        },
      ),
    );
  }
}

