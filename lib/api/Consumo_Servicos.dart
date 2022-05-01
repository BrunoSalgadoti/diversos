import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Consumo_Servicos extends StatefulWidget {
  const Consumo_Servicos({Key? key}) : super(key: key);

  @override
  _Consumo_ServicosState createState() => _Consumo_ServicosState();
}

class _Consumo_ServicosState extends State<Consumo_Servicos> {
  _recuperarCep() async {
    //Recuperar dados de uma variável
    //Uri cep = Uri.parse("01001000");
    //Uri url = Uri.parse("http://viacep.com.br/ws/${cep}/json/");

    Uri url = Uri.parse("http://viacep.com.br/ws/01001000/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print(
        "Resposta: \n Logradouro - ${logradouro} \n Complemento - ${complemento} \n"
        "bairro - ${bairro} \n Localidade - ${localidade} ");

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
        padding: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                          top: 10, left: 40, right: 40, bottom: 10),
                      primary: Colors.white,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _recuperarCep,
                    child: const Text("Clique Aqui"),
                  ),
                ],
              ),
            ),
            // FIM sizeBox
          ],
        ),
      ),
    );
  }
}
