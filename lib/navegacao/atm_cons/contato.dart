import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contato extends StatefulWidget {
  const contato({Key? key}) : super(key: key);

  @override
  _contatoState createState() => _contatoState();
}

class _contatoState extends State<contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Color(0xff61bd8c),
      ),

      body: Container(
        margin: EdgeInsets.only(left: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget> [

            Row(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(top: 20, bottom: 10, right: 10),
                  child: Image.asset("imagens/atm_cons/detalhe_contato.png"),
                ),

                Text(
                    "Contato",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff61bd8c),
                  ),)

              ],),

            Padding(padding: EdgeInsets.only(bottom: 20),
              child: Text("E-mail: consultoria@atm.com.br"),
            ),

            Text("Telefone: (11) 3333-2222"),
            Text("Celular:  (11) 9 9999-8888")

          ],),

      ),
    );
  }
}
