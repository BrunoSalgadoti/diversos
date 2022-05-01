import 'package:flutter/material.dart';

class servico extends StatefulWidget {
  const servico({Key? key}) : super(key: key);

  @override
  _servicoState createState() => _servicoState();
}

class _servicoState extends State<servico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Serviços"),
        backgroundColor: Color(0xff19d1c8),
      ),

      body: Container(
        margin: EdgeInsets.only(top: 10, left: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget> [

            Row(
              children: <Widget> [

                Padding(padding: EdgeInsets.only(right: 15, bottom: 20),
                  child: Image.asset("imagens/atm_cons/detalhe_servico.png"),
                ),

                Text(
                    "Nossos Serviços",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff19d1c8),
                  ),)

              ],),

            Text("Consultoria"),

            Padding(padding: EdgeInsets.only(top: 10),
            child: Text("Preços \nAcompanhamento de Projetos")
            )

          ],),
      ),
    );
  }
}
