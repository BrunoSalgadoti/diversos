import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({Key? key}) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}
class _FloatingButtonState extends State<FloatingButton> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Esse botão não é do tipo Widget!!!!!!
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      //floatingActionButton: FloatingActionButton( //padrão só o ícone

      floatingActionButton: FloatingActionButton.extended( //Pode Colocar nome e Icone
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(4)),

        onPressed: () {
          print("Resultado: Botão pressionado");
        },

        // Faz parte do FloatingButtom Normal
        //mini: true,
        /*child: Icon(Icons.add),
                      onPressed: () {
          print("Resultado: Botão pressionado");
        },*/
      ),

      appBar: AppBar(
        title: Center(
          child: Text("Lista de tarefas",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),),
        backgroundColor: Color(0xffa224b2),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,

        child: Column(

          children: <Widget> [

            Text("Conteúdo a ser Desenvolvido")

          ],),
      ),
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), // Funde o Float Buttton no AppBar
          child: Row(

            children: <Widget> [

              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu)
              )

            ],)
      ),
    );
  }
}
