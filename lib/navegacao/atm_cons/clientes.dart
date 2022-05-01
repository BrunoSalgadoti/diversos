import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class clientes extends StatefulWidget {
  const clientes({Key? key}) : super(key: key);

  @override
  _clientesState createState() => _clientesState();
}

class _clientesState extends State<clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Clientes"),
        backgroundColor: Color(0xffb9c941),
      ),

      body: Container(
        margin: EdgeInsets.only(left: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget> [

            Row(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 10),
                  child: Image.asset("imagens/atm_cons/detalhe_cliente.png"),
                ),
                Text(
                  "Clientes",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffb9c941),
                  ),),
              ],),

            Image.asset("imagens/atm_cons/cliente1.png"),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: const Text(
                  "Empresa de Software",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),

            Image.asset("imagens/atm_cons/cliente2.png"),
           Text(
                    "Empresa de Auditoria",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))

          ],),
      ),
    ) ;
  }
}
