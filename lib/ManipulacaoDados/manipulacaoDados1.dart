import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ManipulacaoDados1 extends StatefulWidget {
  const ManipulacaoDados1({Key? key}) : super(key: key);

  @override
  _ManipulacaoDados1State createState() => _ManipulacaoDados1State();
}

class _ManipulacaoDados1State extends State<ManipulacaoDados1> {
  @override
  Widget build(BuildContext context) {

    String _textoSalvo = "Nada Salvo!";
    TextEditingController _controleCampo = TextEditingController();

    _salvar() async {

      String valorDigitado = _controleCampo.text;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("nome", valorDigitado);

      print("Operação (Salvar): $valorDigitado");

    }

    _recuperar() async {

      final prefs = await SharedPreferences.getInstance();

      setState(() {
        _textoSalvo = prefs.getString("nome") ?? "Sem Valor";
      });

      print("Operação (Recuperar): $_textoSalvo");

    }

    _remover() async {

      final prefs = await SharedPreferences.getInstance();
      prefs.remove("nome");

      print("Operação (Remover)");
    }

    return Scaffold(

      appBar: AppBar(
          title: Center(
            child: Text("Manipulação Dados - Aula 01"),
          )),

      body: Container(
        padding: EdgeInsets.all(30),

        child: Column(
          children: <Widget> [

            Padding(padding: EdgeInsets.only(bottom: 10),

                child: Text(_textoSalvo,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )),

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Digite algo",
                  labelStyle: TextStyle(
                    fontSize: 20,
                  )),
              controller: _controleCampo,
            ),

            Padding(padding: EdgeInsets.only(top: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget> [

                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text("Salvar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _salvar,
                  ),

                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text("Recuperar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _recuperar,

                  ),

                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text("Remover",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: _remover,
                  ),
                ],),

            )],),
      ),
    );
  }
}
