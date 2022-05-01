import 'package:brn_apps_aulas/navegacao/nomear_rotas/secundaria_rotas.dart';
import 'package:flutter/material.dart';

class Home_nomearRotas extends StatefulWidget {
  const Home_nomearRotas({Key? key}) : super(key: key);

  @override
  _Home_nomearRotasState createState() => _Home_nomearRotasState();
}

class _Home_nomearRotasState extends State<Home_nomearRotas> {
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
                Navigator.popAndPushNamed(
                    context,
                    "/secundaria"
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
