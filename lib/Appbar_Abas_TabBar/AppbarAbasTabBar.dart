import 'package:brn_apps_aulas/Appbar_Abas_TabBar/paginas/PrimeiraPagina.dart';
import 'package:brn_apps_aulas/Appbar_Abas_TabBar/paginas/SegundaPagina.dart';
import 'package:brn_apps_aulas/Appbar_Abas_TabBar/paginas/TerceiraPagina.dart';
import 'package:flutter/material.dart';

class AppbarAbasTabBar extends StatefulWidget {
  const AppbarAbasTabBar({Key? key}) : super(key: key);

  @override
  _AppbarAbasTabBarState createState() => _AppbarAbasTabBarState();
}

class _AppbarAbasTabBarState extends State<AppbarAbasTabBar>
    with SingleTickerProviderStateMixin{

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: 1 //Define a página a qual vc quer que inicie
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Abas"),

        bottom: TabBar(
          controller: _tabController,

          tabs: <Widget> [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email),
            ),
            Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],),
      ),

      body: TabBarView(
        controller: _tabController,

        children: <Widget> [

          PrimeiraPagina(),

          SegundaPagina(),

          TerceiraPagina()

        ],),

    );
  }
}
