import 'package:brn_apps_aulas/APPs/anotacoes/helper/AnotacoesHelper.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/model/Anotacao.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/model/Removida.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ffi/ffi.dart';


class AnotacoesApp extends StatefulWidget {
  const AnotacoesApp({Key? key}) : super(key: key);

  @override
  _AnotacoesAppState createState() => _AnotacoesAppState();
}

class _AnotacoesAppState extends State<AnotacoesApp> {

  TextEditingController _tituloControle = TextEditingController();
  TextEditingController _descricaoControle = TextEditingController();
  var _db = AnotacaoHelper();

  List<Anotacao> _anotacoes = <Anotacao>[];
  List<Removida> _removida = <Removida>[];



  _exibirTelaCadastro( {Anotacao? anotacao } ){

    String textoSalvarAtualizar = "";

    if ( anotacao == null ){//Salvando
      _tituloControle.text = "";
      _descricaoControle.text = "";
      textoSalvarAtualizar = "salvar";
    }else{//atualizar
      _tituloControle.text = anotacao.titulo.toString();
      _descricaoControle.text = anotacao.descricao.toString();
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(

            title: Center(
              child: Text("$textoSalvarAtualizar anotações"),
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

                        _salvarAtualizarAnotacao( anotacaoAtualizada: anotacao);
                        Navigator.pop(context);
                      },

                      child: Text("$textoSalvarAtualizar",
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
    //print("Lista Anotações: " + anotacoesRecuperadas.toString());

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

  _salvarAtualizarAnotacao( { Anotacao? anotacaoAtualizada }) async {

    String titulo = _tituloControle.text;
    String descricao = _descricaoControle.text;

    if ( anotacaoAtualizada == null ){//Salvar

      Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao( anotacao );

    }else{//Atualizando

      anotacaoAtualizada.titulo    = titulo;
      anotacaoAtualizada.descricao = descricao;
      anotacaoAtualizada.data      = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao( anotacaoAtualizada );

    }

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

    var formatador = DateFormat("dd/MM/yyyy -  HH:mm.ss");
    //var formatador = DateFormat.yMMMMd("pt_BR");

    DateTime dataConvertida = DateTime.parse( data );
    String dataFormatada = formatador.format( dataConvertida );

    return dataFormatada;

  }

  _salvarTarefaRemovida (Removida removida) async {
    await _db.salvarTarefaRemovida(removida);
    print("Removida: ${removida}");
  }

  _desfazerTarefaRemovida (Removida removida) async {
    List desfazerTarefaRemovida = (await _db.desfazerTarefaRemovida(removida)) as List;
    print("Lista Removida: " + desfazerTarefaRemovida.toString());

    List<Removida>? lixeira = <Removida>[];

    for ( var item in desfazerTarefaRemovida ){

      Removida removida = Removida.fromMap( item );
      lixeira.add( removida );
    }

    setState(() {
      _removida = lixeira;
    });



    _recuperarAnotacoes();

  }

  _removerAnotacao(int? id) async{

    await _db.removerAnotacao( id! );

    _salvarTarefaRemovida;
    _recuperarAnotacoes();

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

          _desfazerTarefaRemovida;
          _recuperarAnotacoes();

        },
      ),));

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
                  child: Text("Anotações e compromissos",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                )
            )),

        body: Column(

          children: <Widget> [

            Expanded(
                child: ListView.builder(
                    itemCount: _anotacoes.length,
                    itemBuilder:(context, index){

                      final anotacao = _anotacoes[index];
                      final recuperar = _anotacoes[index];

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

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget> [

                              GestureDetector(
                                onTap: (){
                                  _exibirTelaCadastro( anotacao: anotacao );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: (){

                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          backgroundColor: Colors.red,
                                          title:  Center(
                                            child: Text("TEM CERTEZA QUE DESEJA EXCLUIR ANOTAÇÃO!!! \n \n "
                                                " ${anotacao.titulo}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.yellow,
                                              ),),

                                          ),

                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                          ),

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
                                                      primary: Colors.green,
                                                      shadowColor: Colors.white,
                                                      elevation: 8,
                                                    ),
                                                  ),

                                                  ElevatedButton(
                                                    onPressed: (){

                                                      _removerAnotacao( anotacao.id);
                                                      Navigator.pop(context);

                                                    },

                                                    child: Text("CONFIRMAR",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.yellow,
                                                      shadowColor: Colors.red,
                                                      elevation: 5,
                                                      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                                    ),
                                                  ),
                                                ])
                                          ],);
                                      });

                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],),//trailing
                        ),

                      );

                    } //item build

                ))

          ],),


        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,

            child: const Icon(
              Icons.add,),

            onPressed: (){
              _exibirTelaCadastro();
            }),

        bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen,
            shape: CircularNotchedRectangle(), // Funde o Float Buttton no AppBar
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [

                  Image.asset("imagens/logobrn.png", width: 90, height: 60,),

                  Padding(padding: EdgeInsets.only(right: 16)),

                  Text("Learning for the Future!!!",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)

                ])

        )





    );

  }
}
