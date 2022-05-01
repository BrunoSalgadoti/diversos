import 'package:brn_apps_aulas/APPs/anotacoes/helper/AnotacoesHelper.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/model/Anotacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class anotacoes2 extends StatefulWidget {
  const anotacoes2({Key? key}) : super(key: key);

  @override
  _anotacoes2State createState() => _anotacoes2State();
}

class _anotacoes2State extends State<anotacoes2> {

  TextEditingController _tituloControle = TextEditingController();
  TextEditingController _descricaoControle = TextEditingController();
  var _db = AnotacaoHelper();

  List<Anotacao> _anotacoes = <Anotacao>[];

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

  _recuperarAnotacoes () async{

    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    print("Lista Anotações: " + anotacoesRecuperadas.toString());

    List<Anotacao>? listatemporaria = <Anotacao>[];

    for ( var item in anotacoesRecuperadas ){

      Anotacao anotacao = Anotacao.fromMap( item );
      listatemporaria.add( anotacao );
    }

    setState(() {
      _anotacoes = listatemporaria!;
    });
    listatemporaria = null;

  }

  _salvarAnotacao() async {

    String titulo = _tituloControle.text;
    String descricao = _descricaoControle.text;


    Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
    int resultado = await _db.salvarAnotacao( anotacao );

  /*
    print("Salvar anotação: " + resultado.toString());
    print("Título:" + titulo);
    print("Descrição:" + descricao);
    print("data atual:  " + DateTime.now().toString());
  */

    _tituloControle.clear();
    _descricaoControle.clear();

    _recuperarAnotacoes();

  }

  _formatarData (String data){

    initializeDateFormatting("pt_BR");

    // Year -> y, month -> M, Day -> d
    // Hour -> H, minute -> m, second -> s

    //var formatador = DateFormat("dd/MM/yyyy -  HH:mm.ss");
    var formatador = DateFormat.yMMMMd("pt_BR");

    DateTime dataConvertida = DateTime.parse( data );
    String dataFormatada = formatador.format( dataConvertida );

    return dataFormatada;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarAnotacoes();
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

      body: Column(

        children: <Widget> [

          Expanded(
              child: ListView.builder(
                  itemCount: _anotacoes.length,
                  itemBuilder:(context, index){

                    final anotacao = _anotacoes[index];

                    return Card(
                      child: ListTile(

                        title: Text(anotacao.titulo.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),),

                        subtitle: Text("${anotacao.descricao} \n ${_formatarData(anotacao.data.toString())}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                      ),
                    );
                  } //item build
              ))
        ],),

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
