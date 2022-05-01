import 'package:brn_apps_aulas/APPs/ListaDeTarefas/FloatingButton.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/helper/AnotacoesHelper.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/model/Anotacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class anotacoes extends StatefulWidget {
  const anotacoes({Key? key}) : super(key: key);

  @override
  _anotacoesState createState() => _anotacoesState();
}

class _anotacoesState extends State<anotacoes> {


  TextEditingController _tituloControle = TextEditingController();
  TextEditingController _descricaoControle = TextEditingController();
  var _db = AnotacaoHelper();


  _exibirTelaCadastro(){

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(

            title: Center(
              child: Text("Adicionar anotações"),
            ),

            content: Column(
              mainAxisSize: MainAxisSize.min,

              children: <Widget> [
                TextField(
                  controller: _tituloControle,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "Título",
                      hintText: "Digite o Título..."
                  ),),

                TextField(
                  controller: _descricaoControle,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "Descrição",
                      hintText: "Digite a Descrição..."
                  ),)

              ],),

            actions: <Widget>[

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [

                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),

                      child: const Text("Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),

                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shadowColor: Colors.black,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: (){

                        _salvarAnotacao();
                        Navigator.pop(context);
                      },

                      child: const Text("Salvar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),

                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shadowColor: Colors.black,
                        elevation: 8,
                        //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      ),
                    ),
                  ])
            ],);
        });
  }

  _salvarAnotacao() async {

    String titulo = _tituloControle.text;
    String descricao = _descricaoControle.text;


    Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
    int resultado = await _db.salvarAnotacao( anotacao );

    print("Salvar anotação: " + resultado.toString());
    print("Título:" + titulo);
    print("Descrição:" + descricao);
    print("data atual:  " + DateTime.now().toString());

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: (
          AppBar(
              backgroundColor: Colors.lightGreen,
              title: const Center(
                child: Text("Anotações"),
              )
          )),

      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,

          child: const Icon(
            Icons.add,),

          onPressed: (){
            _exibirTelaCadastro();
          }),

    );

  }
}
