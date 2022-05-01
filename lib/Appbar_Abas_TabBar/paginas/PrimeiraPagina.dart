import 'package:flutter/material.dart';

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({Key? key}) : super(key: key);

  @override
  _PrimeiraPaginaState createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  @override
  Widget build(BuildContext context) {

    return Center(

      child: Text("Primeira Página",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),

    );
  }
}
