import 'package:brn_apps_aulas/api/listas/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class listas_Api2 extends StatefulWidget {
  const listas_Api2({Key? key}) : super(key: key);

  @override
  _listas_Api2State createState() => _listas_Api2State();
}

class _listas_Api2State extends State<listas_Api2> {

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

  _post () async{

    String urlBase = "https://jsonplaceholder.typicode.com";
    Uri _url = Uri.parse(urlBase + "/posts");

    var corpo = json.encode(
        {
          "userId": 500,
          "id": null,
          "title": "Título da Postagem",
          "body": "Corpo da Postagem"
        }
    );
    http.Response response = await http.post(
      _url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo ,
    );

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");

  }

  _put () async{

    String urlBase = "https://jsonplaceholder.typicode.com";
    Uri _url = Uri.parse(urlBase + "/posts/2");

    var corpo = json.encode(
        {
          "userId": 300,
          "id": null,
          "title": "Título Modificado",
          "body": "Corpo Modificado"
        }
    );
    http.Response response = await http.put(
      _url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo ,
    );

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");

  }

  _patch () async{

    String urlBase = "https://jsonplaceholder.typicode.com";
    Uri _url = Uri.parse(urlBase + "/posts/3");

    //-------Outra forma de definir o Corpo da Postagem-----------
    //Post post = Post(120, null, "Título", "Corpo da Mensagem");
    //-------Criar um método POST para Substituir o Corpo --------

    // ------ Metodo post a ser Instanciado na CLASS POST: -------
    /* OBS: Copiar abaixo de Post(This._userID, This._id ... -----

    Map toJson () {
    return {
          "userId": this._userId,
          "id": this._id,
          "title": this._title,
          "body": this._body
        }
    }
     */

        // Primeiro método de definir o corpo na prória instancia ---------
    // OBS: o Método abaixo terá que ser instanciado na CLASS POST ---

    /*
    var corpo = json.encode(
        {
          "userId": 150,
          //"id": null,
          //"title": null,
          "body": "Corpo Atualizado"
        };
    );
      */

    //---------------exemplo do novo Corpo---------------------------------
    Post post = Post(120, null, "Título", "Corpo da Mensagem");

    var corpo = json.encode(
    post.toJson()
    );
    //OBS: Lembrar de colocar "Map toJson ()" na CLASS POST ----------------

    http.Response response = await http.patch(
      _url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: corpo ,
    );

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");

  }

  _delete () async{

    String urlBase = "https://jsonplaceholder.typicode.com";
    Uri _url = Uri.parse(urlBase + "/posts/10");

    http.Response response = await http.delete(
      _url,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
      if (response.statusCode == 200) {

        print("Dados Deletado com Sucesso!!");

    }else{

    print("Dados ERRO ao DELETAR");

    }

    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),

      body: Container(
        padding: EdgeInsets.all(16),

        child: Column(
          children: <Widget> [

            Row(
              children: <Widget> [

                RaisedButton(
                    child: Text("Salvar"),
                    onPressed:  _post
                ),

                RaisedButton(
                    child: Text("Modificar"),
                    onPressed:  _put
                ),

                RaisedButton(
                    child: Text("Atualizar"),
                    onPressed:  _patch
                ),

                RaisedButton(
                    child: Text("Deletar"),
                    onPressed:  _delete
                )

              ],),

            Expanded(child: FutureBuilder<List<Post>>(

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

            ))

          ],),
      ),
    );
  }
}

