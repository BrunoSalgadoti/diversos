import 'package:brn_apps_aulas/APPs/AprendaIngles/paginas/Bichos.dart';
import 'package:brn_apps_aulas/APPs/AprendaIngles/paginas/Numeros.dart';
import 'package:brn_apps_aulas/APPs/AprendaIngles/paginas/Vogais.dart';
import 'package:flutter/material.dart';

class AprendaIngles extends StatefulWidget {
  const AprendaIngles({Key? key}) : super(key: key);

  @override
  _AprendaInglesState createState() => _AprendaInglesState();
}

class _AprendaInglesState extends State<AprendaIngles>
    with TickerProviderStateMixin {

  late TabController  _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller  = TabController(
        length: 3,
        vsync: this
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.brown,

          title: Center(
            child: Text("Aprendendo Inglês"),
          ),

          bottom: TabBar(
            controller: _tabcontroller,
            indicatorWeight: 4.0,
            indicatorColor: Colors.white,
            //labelColor: Colors.white,
            unselectedLabelColor: Colors.cyan,

            tabs: <Widget> [

              Tab(
                child: Text("Bichos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Tab(
                child: Text("Números",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Tab(
                child: Text("Vogais",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),

            ],),
        ),

        body: TabBarView(
          controller: _tabcontroller,

          children: <Widget>  [

            Bichos(),
            Numeros(),
            Vogais(),

          ],)
    );
  }
}
