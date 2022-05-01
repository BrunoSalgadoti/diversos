import 'package:flutter/material.dart';

class biblioteca extends StatefulWidget {
  const biblioteca({Key? key}) : super(key: key);

  @override
  _bibliotecaState createState() => _bibliotecaState();
}

class _bibliotecaState extends State<biblioteca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "Exibição da Biblioteca",
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
