import 'package:flutter/material.dart';

class listas_personalizadas extends StatefulWidget {
  const listas_personalizadas({Key? key}) : super(key: key);

  @override
  _listas_personalizadasState createState() => _listas_personalizadasState();
}

class _listas_personalizadasState extends State<listas_personalizadas> {

  List _itens = [];

  void _carregarItens (){

    //Reinicia ao carregamento
    _itens = [];

    //Laço de repetição
    for(int i=0; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título: ${i} \nBruno de Pádua";
      item["descricao"] = "Descrição: Analista de Sistemas\n";
      _itens.add(item);

    }
  }
  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.yellow,

          title: Center(
            child:  Text(
              "Listas Alert Dialog",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
              ),),
          )
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
                onTap: (){
                  //print("Clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: Colors.yellowAccent,

                          title: Text( _itens[indice]["titulo"] ),
                          titlePadding: EdgeInsets.all(30),
                          titleTextStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo
                          ),

                          content: Text( _itens[indice]["descricao"] ),
                          contentTextStyle: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.black
                          ),

                          actions: [

                            FlatButton(
                                onPressed: (){
                                  print("Selecionado SIM");
                                  Navigator.pop(context);
                                },
                                child: Text(
                                    "Sim",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              color: Colors.black54,
                            ),

                            FlatButton(
                              onPressed: (){
                                print("Selecionado NÃO");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Não",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.black54,
                            )
                          ],);
                      });},

                /*onLongPress: (){
                  print("Clique com LongTap");
                },*/

                title: Text( _itens[indice]["titulo"] ),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            } ),

      ),
    );
  }
}
