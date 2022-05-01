import 'package:flutter/material.dart';


class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String? _escolhaUsuario;
  String? _escolhaUsuario2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Entrada Radio Button"),
      ),

      body: Container(


        child: Column(

          children: <Widget> [

            const Padding(
              padding: EdgeInsets.only(top: 20),

              child: Text(
                "Exemplo Abaixo: Radio LIST",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),

            RadioListTile(
                title: Text("Masculino"),
                value: "M",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  setState(() {
                    _escolhaUsuario = escolha!;
                  });
                }),

            RadioListTile(
                title: Text("Feminino"),
                value: "F",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  setState(() {
                    _escolhaUsuario = escolha!;
                  });
                }),

            ElevatedButton(
              onPressed:(){
                print("Resultado: " + _escolhaUsuario!);
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

            const Padding(
              padding: EdgeInsets.only(top: 20),

              child: Text(
                  "Segundo Exemplo Abaixo: Simples Radio",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              ),
            ),

            Row(

              children: <Widget> [

                Text("Masculino"),
                Radio(
                    value: "M",
                    groupValue: _escolhaUsuario2,
                    onChanged: (String? escolha){
                      setState(() {
                        _escolhaUsuario2 = escolha!;
                      });
                      print("Resultado: " + escolha!);
                    }),

                Text("Feminino"),
                Radio(
                    value: "F",
                    groupValue: _escolhaUsuario2,
                    onChanged: (String? escolha){
                      setState(() {
                        _escolhaUsuario2 = escolha!;
                      });
                      print("Resultado: " + escolha!);
                    })],)

          ],),
      ),
    );
  }
}
