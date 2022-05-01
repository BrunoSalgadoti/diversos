import 'package:flutter/material.dart';

class inscricao extends StatefulWidget {
  const inscricao({Key? key}) : super(key: key);

  @override
  _inscricaoState createState() => _inscricaoState();
}

class _inscricaoState extends State<inscricao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Exibição da Inscrições",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
