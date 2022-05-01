import 'package:brn_apps_aulas/APPs/anotacoes/helper/AnotacoesHelper.dart';

class Removida {

  int? id;
  String? titulo;
  String? descricao;
  String? data;

  Removida (this.titulo, this.descricao, this.data);

  Removida.fromMap( Map mapa ) {

    this.id = mapa[AnotacaoHelper.colunaId];
    this.titulo = mapa[AnotacaoHelper.colunaTitulo];
    this.descricao = mapa[AnotacaoHelper.colunaDescricao];
    this.data = mapa[AnotacaoHelper.colunaData];

  }

  Map toMap() {

    Map<String, dynamic> mapa = {
      "${AnotacaoHelper.colunaTitulo}" : this.titulo,
      "${AnotacaoHelper.colunaDescricao}" : this.descricao,
      "${AnotacaoHelper.colunaData}" : this.data,
    };

    if ( this.id != null ){
      mapa["${AnotacaoHelper.colunaId}"] = this.id;
    }
    return mapa;
  }
}