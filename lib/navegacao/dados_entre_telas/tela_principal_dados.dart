import 'package:brn_apps_aulas/navegacao/dados_entre_telas/Tela_dados.dart';
import 'package:flutter/material.dart';

class tela_principal_dados extends StatefulWidget {
  const tela_principal_dados({Key? key}) : super(key: key);

  @override
  _tela_principal_dadosState createState() => _tela_principal_dadosState();
}

class _tela_principal_dadosState extends State<tela_principal_dados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),

      body: Container(
        padding: EdgeInsets.all(32),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,



          children: <Widget> [

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tela_dados(valor: "Bruno de Pádua")
                    )
                );
              },

              child: const Text(
                "Ir para a Segunda Tela",
                style: TextStyle(
                  fontSize: 20,
                  decorationColor: Colors.black,
                ),
              ),

              //ElevatedButton CUSTOMIZAÇÃO

              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 15,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

          ],

        ),
      ),

    );
  }
}
