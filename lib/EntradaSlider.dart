import 'dart:ffi';

import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 0;
  String label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),

      body: Container(
        padding: EdgeInsets.all(60),

        child: Column(

          children: [

            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: label,
                divisions: 10,
                activeColor: Colors.red,
                inactiveColor: Colors.black26,
                onChanged: (double novoValor ){
                  setState(() {
                    valor = novoValor;
                    label = "Valor Selecionado " + novoValor.toString();
                  });
                  //print("Valor selecionado:" + novoValor.toString());
                }
            ),

            ElevatedButton(
              onPressed:(){
                print("Valor Selecionado:  + ($valor)");
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
        ),
      ),
    );
  }
}
