import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class ListaDeTarefas extends StatefulWidget {
  ListaDeTarefas({Key? key}) : super(key: key);

  @override
  _ListaDeTarefasState createState() => _ListaDeTarefasState();
}
class _ListaDeTarefasState extends State<ListaDeTarefas> {

  List _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();

  Future <File> _getFile () async{

    final diretorio = await getApplicationDocumentsDirectory();
    return  File( "${diretorio.path}/dados.json");


  }

  //metodo para salvar "capturar" az tarefa digitada no CampoFild"
  _salvarTarefa(){

    String? textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada!"] = false;

    setState(() {
      _listaTarefas.add( tarefa );
    });
    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  //metodo para salvar o arquivo no armazenamento do dispositivo
  _salvarArquivo () async {

    var arquivo = await _getFile();

    //Criar estrutura para armazenar os dados
    /*
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = "Ir ao Mercado";
    tarefa["realizada!"] = false;
    _listaTarefas.add( tarefa );
    */

    String? dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
    //print("Caminho: " + diretorio.path );
  }

  _lerArquivo() async {

    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();

    }catch(e){
      //Usando esta String e recupera o codigo de erro caso aconteça
      //e.toString();
      return  null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then( ( dados ) {
      setState(() {
        _listaTarefas = json.decode( dados );
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //já criou o metodo acima
    //_salvarArquivo();
    //print("itens:" + _listaTarefas.toString());


    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text("Lista de tarefas",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),),
        backgroundColor: Color(0xffa224b2),
      ),

//--------------------------FloatingActionButton--------------------------------
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton( //padrão só o ícone
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        //mini: true,
        child: Icon(Icons.add),
        onPressed: () {

          showDialog(
              context: context,
              builder: (context){

                return AlertDialog(
                    elevation: 30,
                    contentPadding: EdgeInsets.all(20),
                    title: Text("Adicionar tarefa",
                      textAlign: TextAlign.center,
                    ),
                    content: TextField(
                      controller: _controllerTarefa,
                      decoration: InputDecoration(
                          labelText: "Digite sua Tarefa!"
                      ),
                      onChanged: (text){

                      },
                    ),
                    actions: <Widget> [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget> [
                          FlatButton(
                              color: Colors.purpleAccent,
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancelar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)
                          ),
                          FlatButton(
                              color: Colors.purpleAccent,
                              onPressed: (){
                                //salvar
                                _salvarTarefa();
                                Navigator.pop(context);
                              },
                              child: Text("Salvar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)
                          ),

                        ],)

                    ]);
              }
          );
        },
      ),
//--------------------------FloatingActionButton--------------------------------

      body: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,

          child: Column(

            children: <Widget> [

              Expanded(
                child: ListView.builder(
                    itemCount: _listaTarefas.length,
                    itemBuilder: (context, index){

                      return CheckboxListTile(
                        title: Text(_listaTarefas[index]["titulo"]),
                        value: _listaTarefas[index]["realizada!"],
                        onChanged: (valorAlterado){

                          setState(() {
                            _listaTarefas[index]["realizada!"] = valorAlterado;
                          });
                          _salvarArquivo();

                          //print("Valor Alterado: " + valorAlterado.toString());
                        },
                      );

                      /* primeiro exemplo foi com uma lista sem checkbox
                      return ListTile(
                        title: Text(_listaTarefas[index]["titulo"]),
                      );
                      */
                    }),
              )

            ],)
      ),
      backgroundColor: Colors.white,

      /*
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), // Funde o Float Buttton no AppBar
          child: Row(

            children: <Widget> [

              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu)
              )
            ],)
      ),
       */

    );
  }
}
