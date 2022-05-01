import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home_future extends StatefulWidget {
  @override
  _Home_futureState createState() => _Home_futureState();
}

class _Home_futureState extends State<Home_future> {

  Future<Map> _recuperarPreco() async {

    Uri url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);
    return json.decode( response.body);

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: _recuperarPreco() ,
        builder: (context, snapshot){

          String resultado;

          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              print("Conexão WAITING");
              resultado = "Carregando...";
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              print("Conexão DONE");

              if ( snapshot.hasError ){
                resultado = "Erro ao carregar os dados";
              }else{
                double valor = snapshot.data!["BRL"]["buy"];
                resultado = "Preço do Bitcoin: ${valor.toString()}";
              }
              break;
          }
          return Center(
            child: Text( resultado ),
          );
        }
    );
  }
}
