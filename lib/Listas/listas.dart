import 'package:flutter/material.dart';

class listas extends StatefulWidget {
  const listas({Key? key}) : super(key: key);

  @override
  _listasState createState() => _listasState();
}

class _listasState extends State<listas> {

  List _itens = [];

  void _carregarItens (){

    //Reinicia ao carregamento
    _itens = [];

    //Laço de repetição
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título: ${i} Bruno de Pádua";
      item["descricao"] = "Descrição: ${i} Analista de Sistemas";
      _itens.add(item);

    }
  }
  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Listas"),
      ),

      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),

        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {

              //Map<String, dynamic> item = _itens[indice];
              //print("Item: ${ item["titulo"] }");

              return ListTile(
                title: Text( _itens[indice]["titulo"] ),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            } ),

      ),
    );
  }
}
