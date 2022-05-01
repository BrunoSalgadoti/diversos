import 'package:flutter/material.dart';
import 'dart:core';

class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget> [

      IconButton(onPressed: (){
        query = "";
      },
          icon: Icon(Icons.clear)
      ),

      /*
      IconButton(onPressed: (){},
          icon: Icon(Icons.done)
      ),
      */

    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, "");
      },
          icon: Icon(Icons.arrow_back)
      );

  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    //print("Pesquisa Realizada!!");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("resultado: digitado" + query);
    //return Container();

    List<String> lista = [];
    if ( query.isNotEmpty ){

     lista = [
        "Android", "Android Navegação", "IOS", "Jogos"
      ].where(
          (texto) => texto.toLowerCase().startsWith( query.toLowerCase() )
      ).toList();

      return ListView.builder(
          itemCount:  lista.length,
          itemBuilder: (context, index){

            return ListTile(
              onTap: (){
                close(context, lista[index] );              },
              title: Text(lista[index]),
            );}
      );

    }else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }
}