import 'package:brn_apps_aulas/APPs/anotacoes/model/Anotacao.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/model/Removida.dart';
import 'package:brn_apps_aulas/navegacao/Cara_Coroa/tela_Resultado.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ---------------Class -> Padrão Singleton-------------------------------------

class AnotacaoHelper {

  static final String nomeTabela = "anotacao";
  static final String colunaId = "id";
  static final String colunaTitulo = "titulo";
  static final String colunaDescricao = "descricao";
  static final String colunaData = "data";

  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database? _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){
  }

  get db async {

    if ( _db != null ){
      return _db;
    }else{
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate (Database db, int version) async {

    String sql = "CREATE TABLE $nomeTabela ("

        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "titulo VARCHAR, "
        "descricao TEXT, "
        "data DATETIME"
        ")";

    await db.execute(sql);

  }

  inicializarDB() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join (caminhoBancoDados, "banco_minhas_anotacoes.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarAnotacao (Anotacao anotacao) async {

    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, anotacao.toMap() );
    return resultado;

  }

  recuperarAnotacoes() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY $colunaData ASC";
    List anotacoes = await bancoDados.rawQuery( sql );
    return anotacoes;

  }

  Future<int> atualizarAnotacao (Anotacao anotacao) async {

    var bancoDados = await db;

    return await bancoDados.update(
      nomeTabela,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );
  }

  Future<int> removerAnotacao ( int id ) async {

    var bancoDados = await db;

    return await bancoDados.delete(
        nomeTabela,
        where: "id = ?",
        whereArgs: [id]
    );
  }

  Future<int> salvarTarefaRemovida ( Removida removida ) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, removida.toMap());
    return resultado;
  }

  Future<int> desfazerTarefaRemovida ( Removida removida ) async {
    var bancoDados = await db;
    return await bancoDados.insert(
        nomeTabela,
        removida.toMap(),
    where: "id = ?",
    whereArgs: [removida.id]
    );


}


}