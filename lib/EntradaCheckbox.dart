
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Entrada Checkbox"),
      ),

      body:Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget> [
            Padding(padding: EdgeInsets.only(top: 10)),

            CheckboxListTile(
                title: Text(
                  "Comida Brasileira",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                subtitle: Text("Melhor comida do mundo!"),
                activeColor: Colors.red,
                selected: true,
                secondary: Icon(Icons.assignment),

                value: _comidaBrasileira,
                onChanged: (bool? valor){
                  setState(() {
                    _comidaBrasileira = valor!;
                  });
                  //print("Comida Brasileira  " + valor.toString());
                }
            ),

            Padding(padding: EdgeInsets.all(10)),

            CheckboxListTile(
                title: Text(
                  "Comida Mexicana",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                activeColor: Colors.red,
                subtitle: Text("A comida mais apimentada do mundo!"),
                selected: true,
                secondary: Icon(Icons.assignment),

                value: _comidaMexicana,
                onChanged: (bool? valor){
                  setState(() {
                    _comidaMexicana = valor!;
                  });
                  //print("Comida Mexicana  " + valor.toString());
                }
            ),

            Padding(padding: EdgeInsets.all(15)),


            //Meu modo de pensar :) antiquado
            /*
            Row(
                children: <Widget>[
                  Text(
                    "Comida Brasileira",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Checkbox(
                    value: _comidaBrasileira,
                    onChanged: (bool? valor){
                      setState(() {
                        _comidaBrasileira = valor!;
                      });
                      print("Comida Brasileira" + valor.toString());
                    },
                  ),
                ]),

            Row(
                children: <Widget>[
                  Text(
                    "Comida Mexicana",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),),
                  Checkbox(
                    value: _comidaMexicana,
                    onChanged: (bool? valor2){
                      setState(() {
                        _comidaMexicana = valor2!;
                      });
                      print("Checkbox" + valor2.toString());
                    },
                  ),
                ]),
              *************************************************
              */

            ElevatedButton(
              onPressed: (){
                print("Comida Brasileira: " + _comidaBrasileira.toString() +
                    "\n Comida Mexicana: " + _comidaMexicana.toString());

              },
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  elevation: 20,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

          ],),
      ),
    );
  }
}
