import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home_bitcoin extends StatefulWidget {
  const Home_bitcoin({Key? key}) : super(key: key);

  @override
  _Home_bitcoinState createState() => _Home_bitcoinState();
}

class _Home_bitcoinState extends State<Home_bitcoin> {

  String _precoBiticoin = "";

  void _recuperarPreco () async {

    Uri _url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(_url);

    Map<String, dynamic> retorno = json.decode( response.body );

    setState(() {
      _precoBiticoin = retorno["BRL"] ["buy"].toString();
    });

    //print("Resultado: " + retorno["BRL"] ["buy"].toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(30),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget> [

                  Image.asset("imagens/bitcoin/bitcoin.png"),

                  Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child:  Text(
                        "R\$: " + _precoBiticoin,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),

                  // INICIO do sizeBox e Text Button
                  const SizedBox(width: 10, height: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: <Widget> [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color> [
                                  Colors.amber,
                                  Colors.orangeAccent,
                                  Colors.orange,
                                  Colors.deepOrangeAccent,
                                ],),
                            ),
                          ),),

                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          onPressed: _recuperarPreco,
                          child: const Text(
                            "Atualizar",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),),
                      ],),),
                  // FIM do sizeBox e Text Button

                ]),
          ),
        )
    );
  }
}
