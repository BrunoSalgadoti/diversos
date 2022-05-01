import 'package:brn_apps_aulas/navegacao/telaSecundaria/telaSecundaria.dart';
import 'package:flutter/material.dart';



class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
                        builder: (context) => telaSecundaria()
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
