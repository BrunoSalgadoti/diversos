import 'package:flutter/material.dart';

class alcoolGasolina extends StatefulWidget {
  const alcoolGasolina({Key? key}) : super(key: key);

  @override
  _alcoolGasolinaState createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

     String _textoResultado = "";

  void _calcular() {

    double? precoAlcool = double.tryParse( _controllerAlcool.text);
    print("$precoAlcool");
    double? precoGasolina = double.tryParse( _controllerGasolina.text );
    print("$precoGasolina");

    if ( precoAlcool == null || precoGasolina == null ){
         setState(() {
           _textoResultado = "Numero Inválido, digite números maiores que 0 e utilizando (.)";
         });
    }else{
      if(  (precoAlcool / precoGasolina ) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastercer com Gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastercer com Alcool";
        });
      }
      //_limparCampos;
    }
  }

  /*void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,


            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32,),

                child: Image.asset("imagens/alcool_gasolina/logo.png"),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),

                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 30),

                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText:
                    "Preço Alcool, Ex 2.35",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                  controller: _controllerAlcool,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 2),

                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText:
                    "Preço Gasolina, Ex 4.10",
                  ),
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                  controller: _controllerGasolina,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10),

                child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.black87,
                  padding: EdgeInsets.all(10),

                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed:_calcular,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
