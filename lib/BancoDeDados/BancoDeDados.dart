port 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDeDados extends StatefulWidget {
  const BancoDeDados({Key? key}) : super(key: key);

  @override
  _BancoDeDadosState createState() => _BancoDeDadosState();
}

class _BancoDeDadosState extends State<BancoDeDados> {

  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    //var retorno = await openDatabase(
    var db = await openDatabase(

        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente) {
          String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
          db.execute(sql);
        }
    );
    return db;
    //print("aberto: " + retorno.isOpen.toString());

  }

  _salvar() async {
    Database db = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome ": "Miranda Oliveira",
      "idade ": 17
    };

    int id = await db.insert("usuarios", dadosUsuario);
    db.insert("usuarios", dadosUsuario);

    //print("Salvo:  $id");
  }

  _listarUsuarios() async {
    Database db = await _recuperarBancoDados();

    String sql = "SELECT * FROM usuarios";

// VÁRIOS EXEMPLOS DE FILTROS EM BANCO DE DADOS PARA RETORNAR PARAMETROS DESEJADOS-----
    //String sql = "SELECT * FROM usuarios WHERE idade = 40"; //por informações de um campo
    //String sql = "SELECT * FROM usuarios WHERE idade = 40 OR  idade = 30"; //por informações de um campo FILTRANDO com mais informações
    //String sql = "SELECT * FROM usuarios WHERE idade >= 30 AND idade <= 50"; //por informações de um campo FILTRANDO com mais informações
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 30"; // FILTRO ENTRE "BETWEEN" PARAMETROS.
    //String sql = "SELECT * FROM usuarios WHERE idade IN (40,60)"; // FILTRO EM "IN" PARAMETROS EXATOS.
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%Bru%' "; // FILTRA e retorna parametros que tenham parte do filtro chamado
//RETORNANDO DE UM CAMPO EXPECÍFICO: ------------------------------------------
    //String filtro = "Br";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE '%" + filtro +  "%' ";
//RETORNANDO DE UM CAMPO EXPECÍFICO: -------------------------------------------
    //String sql = "SELECT nome FROM usuarios"; //seloeção por campo
    //String sql = "SELECT idade FROM usuarios"; //seloeção por campo
//RETORNANDO POR ORDEM ALFABÉTICA: ASC DESC (ASCENDENTE OU DESCENDENTE)---------
    //String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome ASC"//ordem de forma descendente
    //String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY nome DESC";//ordem de forma ascendente
    //String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC";// UPPER(nome) converte em letras maiusculas
// ----------------------------FIM EXEMPLOS-------------------------------------
    List usuarios = await db.rawQuery(sql);

    for (var usuario in usuarios) {
      print(
          "\n""item id : " + usuario["id"].toString() +
              "\n" "nome : " + usuario["nome"] +
              "\n" "idade : " + usuario["idade"].toString()
      );
    }
    //print("DB Usuários:" + usuarios.toString());
  }

  _listarUsuarioPeloId(int id) async {
    Database db = await _recuperarBancoDados();

    //CRUD -> Create, Read, Update and Delete
    List usuarios = await db.query(
        "usuarios",
        columns: ["id", "nome", "idade"],
        where: "id = ?",
        whereArgs: [id]
    );

    for (var usuario in usuarios) {
      print(
          "item id : " + usuario["id"].toString() +
              "\n" "nome : " + usuario["nome"] +
              "\n" "idade : " + usuario["idade"].toString()
      );
    }
  }

  _excluirUsuario(int id) async {
    Database db = await _recuperarBancoDados();

    int retorno = await db.delete(
        "usuarios",
        //Sem os argumentos abaixo ele exclui toda a tabela
        where: "id = ?",
        whereArgs: [id]

      //excluir todos os usuarios com os dados inseridos
      //where: "nome = ? AND idade =?",
      //ereArgs: ["Manuella Miranda alterado", 35]
    );
    print("Item qtd removida:  $retorno");
  }

  _atualizarUsuario (int id) async {
    Database db = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome ": "Miranda Oliveira Atualizado",
      "idade ": 20
    };

    int retorno = await db.update(
        "usuarios",
        dadosUsuario,
        where: "id = ?",
        whereArgs: [id]
    );

    print("Item qtd Atualizada:  $retorno");
  }


  @override
  Widget build(BuildContext context) {

    //_recuperarBancoDados();
    //_salvar();
    _listarUsuarios();
    //_listarUsuarioPeloId(47);
    //_excluirUsuario(38);
    //_atualizarUsuario(47);


    return Container();
  }

}