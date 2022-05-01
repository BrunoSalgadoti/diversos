import 'package:brn_apps_aulas/navegacao/atm_cons/clientes.dart';
import 'package:brn_apps_aulas/navegacao/atm_cons/contato.dart';
import 'package:brn_apps_aulas/navegacao/atm_cons/empresa.dart';
import 'package:brn_apps_aulas/navegacao/atm_cons/servico.dart';
import 'package:flutter/material.dart';

class telaPrincipal extends StatefulWidget {


  @override
  _telaPrincipalState createState() => _telaPrincipalState();
}

class _telaPrincipalState extends State<telaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),

      body: Container(
        padding: EdgeInsets.all(40),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget> [

            Image.asset("imagens/atm_cons/logo.png"),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget> [

                  GestureDetector(
                      child: Image.asset("imagens/atm_cons/menu_empresa.png") ,
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => empresa()
                            )
                        );}),

                  GestureDetector(
                      child: Image.asset("imagens/atm_cons/menu_servico.png"),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => servico()
                            )
                        );}),
                ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget> [

                GestureDetector(
                  child: Image.asset("imagens/atm_cons/menu_cliente.png"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => clientes() ),
                    );},),

                GestureDetector(
                  child: Image.asset("imagens/atm_cons/menu_contato.png"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => contato())
                    );},)
              ],)
          ],),
      ),
    );
  }
}
