import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _entradaUsuario = false;
  bool _entradaUsuario2 = false;
  bool _escolhaConfiguracoes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),

      body: Container(

        child: Column(

          children: <Widget> [

            Padding(
              padding: EdgeInsets.only(top: 30),

              child: Text(
                "Exemplo de um Switch LIST \n não precisa de uma ROW para ficar um abaixo do outro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),

            SwitchListTile(
                title: Text("Receber Notificações:"),
                value: _entradaUsuario2,
                onChanged: (bool valor2){
                  setState(() {
                    _entradaUsuario2 = valor2;
                  });
                  // print("Receber Notificações SWITCHLIST: " + valor2.toString());
                }
            ),

            SwitchListTile(
                title: Text("Carregar Imagens Automáticas"),
                value: _escolhaConfiguracoes,
                onChanged: (bool valor3){
                  setState(() {
                    _escolhaConfiguracoes = valor3;
                  });
                  // print("Carregar Imagens: " + valor3.toString());
                }
            ),

            Padding(
              padding: EdgeInsets.only(top: 30),

              child: Text(
                "Exemplo de um Switch Simples \n em uma ROW",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),

            Row(
              children: <Widget> [

                Switch(
                    value: _entradaUsuario,
                    onChanged: (bool valor){
                      setState(() {
                        _entradaUsuario = valor;
                      });
                      //  print("Receber Notificações: " + valor.toString());
                    }
                ),
                Text("Receber Notificações?")

              ],),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(
                  onPressed:(){
                    print("Receber Notificações:  + ($_entradaUsuario)");
                    print("Carregar Imagens:  + ($_escolhaConfiguracoes)");
                    print("Receber Notificações SWITCHLIST:  + ($_entradaUsuario2)");
                  },

                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20,
                      decorationColor: Colors.black,
                    ),
                  ),

                  //ElevatedButton CUSTOMIZAÇÃO

                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 20,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ],
            )
          ],),
      ),
    );
  }
}
