import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Consumo_Servicos2 extends StatefulWidget {
  const Consumo_Servicos2({Key? key}) : super(key: key);

  @override
  _Consumo_Servicos2State createState() => _Consumo_Servicos2State();
}

class _Consumo_Servicos2State extends State<Consumo_Servicos2> {

  TextEditingController _controleCep = TextEditingController();
  String _resultado = "Resultado";

  _recuperarCep() async {

    //Recuperar dados de uma variável
    //Uri cep = Uri.parse("01001000");
    //Uri url = Uri.parse("http://viacep.com.br/ws/${cep}/json/");

    String cepDigitado = _controleCep.text;
    Uri url = Uri.parse("http://viacep.com.br/ws/${cepDigitado}/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {

      _resultado = "Longradour:  ${logradouro}, \n"
                   "Complemento: ${complemento}, \n "
                   "Bairro :     ${bairro},\n "
                   "Localidade:  ${localidade}";

    });
/*
    print(
        "Resposta: \n Logradouro - ${logradouro} \n Complemento - ${complemento} \n"
            "bairro - ${bairro} \n Localidade - ${localidade} "
    );
*/
    //print("Status CODE: " + response.statusCode.toString());
    //print("resposta: " + response.body);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),

      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            TextField(
              keyboardType: TextInputType.number,
              maxLength: 8,
                 decoration: InputDecoration(
                  labelText: "Digite o CEP: ex: 45750000"
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _controleCep,
            ),

            // INICIO SizeBox
            const SizedBox(height: 10, width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.deepPurple,
                            Colors.blue,
                            Colors.lightBlue,
                          ],),
                      ),
                    ),),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    onPressed: _recuperarCep,
                    child:  Text("Clique aqui"),
                  ),],
              ),),
            // FIM SizeBox

            Text(
              _resultado,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

          ],),
      ),
    );
  }
}


