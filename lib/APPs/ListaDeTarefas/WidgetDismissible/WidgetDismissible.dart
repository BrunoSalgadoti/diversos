import 'package:flutter/material.dart';

class WidgetDismissible extends StatefulWidget {
  const WidgetDismissible({Key? key}) : super(key: key);

  @override
  _WidgetDismissibleState createState() => _WidgetDismissibleState();
}

class _WidgetDismissibleState extends State<WidgetDismissible> {

  List _lista = [
    "Brasil",
    "Argentina",
    "Inglaterra",
    "EUA",
    "Russia"
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Center(
            child: Text("Widget Dismissible",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),),
          backgroundColor: Colors.blue,
        ),

        body: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,

          child: Column(

            children: <Widget> [

              Expanded(

                  child: ListView.builder(
                      itemCount: _lista.length,
                      itemBuilder: (context, index){

                        final item = _lista[index];

                        return Dismissible(

                            background: Container(
                                color: Colors.red,
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>  [
                                    Icon(
                                        Icons.delete,
                                        color: Colors.white
                                    )
                                  ],
                                )
                            ),

                            secondaryBackground: Container(
                                color: Colors.green,
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>  [
                                    Icon(
                                        Icons.edit,
                                        color: Colors.white
                                    )
                                  ],
                                )
                            ),

                            //direction: DismissDirection.vertical, //Por padrão é Horizontal
                            onDismissed: ( direction ){

                              // possibilidade de configurar o que acontece ao movimento
                              if ( direction == DismissDirection.endToStart){
                                print("direção: endToStart" );
                              }else if ( direction == DismissDirection.startToEnd ){
                                print("direção: startToEnd" );
                              }

                              setState(() {
                                _lista.removeAt(index);

                              });

                              //print("direção: " + direction.toString());

                            },
                            key: Key( item ),
                            child: ListTile(
                              title: Text( item ),
                            )
                        );

                      })
              )
            ],),
        )

    );
  }
}
