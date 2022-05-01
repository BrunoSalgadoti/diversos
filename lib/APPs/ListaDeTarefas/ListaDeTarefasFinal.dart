import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class ListaDeTarefasFinal extends StatefulWidget {
  ListaDeTarefasFinal({Key? key}) : super(key: key);

  @override
  _ListaDeTarefasFinalState createState() => _ListaDeTarefasFinalState();
}
class _ListaDeTarefasFinalState extends State<ListaDeTarefasFinal> {

  List _listaTarefas = [];

  //este MAP armazena os itens excluidos para o snackBar recuperar
  Map<String, dynamic> _ultimaTarefaRemovida = Map();

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

  _salvarArquivo () async {

    var arquivo = await _getFile();

    String? dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);

  }

  _editarArquivo () async {

    var arquivo = await _getFile();

    String? dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);

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

  Widget criarItemLista (context, index) {

    //Inativo após config. de KEY dynamica
    //DateTime.now().microsecondsSinceEpoch.toString()
    //final item = _listaTarefas[index]["titulo"];

    return Dismissible(

// ------------- Configuração grafica do Dismissible ---------------------------
        direction: DismissDirection.horizontal,
        background: Container(
          color: Colors.green,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Icon(
                Icons.edit,
                color: Colors.white,
              )
            ],),
        ),

        secondaryBackground: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],),
        ),


// ----------------- Configuração dos comandos Dismissible ---------------------
        key: Key( DateTime.now().microsecondsSinceEpoch.toString() ),
        onDismissed: ( direction ){

          if ( direction == DismissDirection.endToStart){

//----------------Recuperar o último item excluido -----------------------------
// OBS: Criar MAP para armazenar os itens excluidos (ver Linha 19)
            _ultimaTarefaRemovida = _listaTarefas[index];

//-----------------Remover itens da lista---------------------------------------
            _listaTarefas.removeAt(index);
            _salvarArquivo();

//-------------------------snackBar -------------------------------------------,

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.yellow,
              duration: Duration( seconds: 5),
              content: Text("Tarefa Removida",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              ),
              action: SnackBarAction(
                label: "Desfazer",
                textColor: Colors.black,
                onPressed: (){

                  setState(() {
                    //Iserir novamente os itens na lista
                    _listaTarefas.insert( index, _ultimaTarefaRemovida );
                  });
                  _salvarArquivo();

                },
              ),));

/* ----------------------- DEPRECATED SNACKBAR ---------------------------------
        final snackBar = SnackBar(
          backgroundColor: Colors.green,
            duration: Duration( seconds: 5),
            content: Text("Tarefa Removida"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: (){

            },
          ),
        );
       Scaffold.of(context).showSnackBar(snackBar);
*/// ----------------------- DEPRECATED SNACKBAR -------------------------------

          }else if ( direction == DismissDirection.startToEnd ){
            print("Ainda em Aprendizado");
          }

        },
        child: CheckboxListTile(
          title: Text(_listaTarefas[index]["titulo"]),
          value: _listaTarefas[index]["realizada!"],
          onChanged: (valorAlterado){

            setState(() {
              _listaTarefas[index]["realizada!"] = valorAlterado;
            });
            _salvarArquivo();

            //print("Valor Alterado: " + valorAlterado.toString());
          },
        )
    );

  }

  //Converter os dados em Json
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

    //_salvarArquivo();
    //OBS: para não dá conflito nos index quando recuperar o arquivo gera key diferentes
    //print("Itens: " + DateTime.now().microsecondsSinceEpoch.toString());

    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text("Lista de tarefas",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),),
        backgroundColor: Colors.blue,
      ),

//--------------------------FloatingActionButton--------------------------------
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton( //padrão só o ícone
        backgroundColor: Colors.blue,
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
                    itemBuilder: criarItemLista
                ),
              )

            ],)
      ),
      backgroundColor: Colors.white,

    );
  }
}
