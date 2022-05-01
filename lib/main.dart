import 'package:brn_apps_aulas/APPs/AprendaIngles/AprendaIngles.dart';
import 'package:brn_apps_aulas/APPs/ListaDeTarefas/FloatingButton.dart';
import 'package:brn_apps_aulas/APPs/ListaDeTarefas/ListaDeTarefas.dart';
import 'package:brn_apps_aulas/APPs/ListaDeTarefas/ListaDeTarefasDismissSnackbar.dart';
import 'package:brn_apps_aulas/APPs/ListaDeTarefas/ListaDeTarefasFinal.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/AnotacoesApp.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/anotacoes.dart';
import 'package:brn_apps_aulas/APPs/anotacoes/anotacoes2.dart';
import 'package:brn_apps_aulas/Appbar_Abas_TabBar/AppbarAbasTabBar.dart';
import 'package:brn_apps_aulas/BancoDeDados/BancoDeDados.dart';
import 'package:brn_apps_aulas/ManipulacaoDados/manipulacaoDados1.dart';
import 'package:brn_apps_aulas/APPs/youtube/youTube_Api.dart';
import 'package:brn_apps_aulas/EntradaRadioButton.dart';
import 'package:brn_apps_aulas/EntradaSlider.dart';
import 'package:brn_apps_aulas/EntradaSwitch.dart';
import 'package:brn_apps_aulas/Midias/ExecutandoSons.dart';
import 'package:brn_apps_aulas/Midias/ExecutandoSons_P_P_S.dart';
import 'package:brn_apps_aulas/Midias/ExecutandoVideos.dart';
import 'package:brn_apps_aulas/api/Consumo_Servico2.dart';
import 'package:brn_apps_aulas/api/Consumo_Servicos.dart';
import 'package:brn_apps_aulas/navegacao/Cara_Coroa/Home_CaraCoroa.dart';
import 'package:brn_apps_aulas/navegacao/dados_entre_telas/tela_principal_dados.dart';
import 'package:brn_apps_aulas/navegacao/nomear_rotas/secundaria_rotas.dart';
import 'package:brn_apps_aulas/navegacao/telaSecundaria/TelaPrincipal.dart';
import 'package:brn_apps_aulas/frases_do_dia.dart';
import 'package:brn_apps_aulas/frases_do_dia_imagens.dart';
import 'package:brn_apps_aulas/APPs/APP_frases_do_dia.dart';
import 'package:brn_apps_aulas/APPs/jokenPo.dart';
import 'package:brn_apps_aulas/antrada_dados.dart';
import 'package:brn_apps_aulas/APPs/alcoolGasolina.dart';
import 'package:brn_apps_aulas/EntradaCheckbox.dart';
import 'package:brn_apps_aulas/navegacao/atm_cons/telaPrincipal.dart';
import 'package:brn_apps_aulas/navegacao/nomear_rotas/Home_nomearRotas.dart';
import 'package:brn_apps_aulas/APPs/preco_bitcoin/Home_bitcoin.dart';
import 'package:brn_apps_aulas/Listas/listas.dart';
import 'package:brn_apps_aulas/Listas/listas_personalizadas.dart';
import 'package:brn_apps_aulas/api/Home_future.dart';
import 'package:brn_apps_aulas/api/listas/listas_Api.dart';
import 'package:brn_apps_aulas/api/listas/listas_Api2.dart';
import 'package:brn_apps_aulas/APPs/youtube/youTube_AppBar.dart';
import 'package:brn_apps_aulas/APPs/youtube/youTube_BottomNavigatorbar.dart';
import 'package:flutter/material.dart';
import 'APPs/ListaDeTarefas/ListaDeTarefasDismissible.dart';
import 'APPs/ListaDeTarefas/WidgetDismissible/WidgetDismissible.dart';


void main (){

  runApp( MaterialApp(

// --------------Frases aleatórias e imagens------------------------------------
    //home: frases_do_dia(),
    //home: frases_do_dia_imagens(),
    //home: APP_frases_do_dia(),
    //home: JokenPo(),

// --------------Entrada de DADOS-----------------------------------------------
    //home: entrada_dados(),
    //home: alcoolGasolina(),
    //home: EntradaCheckbox(),
    //home: EntradaRadioButton(),
    //home: EntradaSwitch(),
    //home:  EntradaSlider(),

// --------------Navegação entre telas------------------------------------------
    //home: TelaPrincipal(),
    //home: telaPrincipal(),
    //home: tela_principal_dados(),
    //home: Home_CaraCoroa(),

// -------NAVEGANDO ENTRE TELAS COM ROTAS DE NAVEGAÇÃO--------------------------
/*
    initialRoute: "/",
    routes: {
      "/secundaria" : (context) => secundaria_rotas(valor: '',)
    },
    home: Home_nomearRotas(),
*/

//----------TRABALHANDO COM API ------------------------------------------------
    //home: Consumo_Servicos(),
    //home: Consumo_Servicos2(),
    //home: Home_bitcoin(),
// ----------TRABALHANDO COM FUTURE (CONSUMO DE SERVIÇO WEB (API))--------------
    //home: Home_future(),

// ----------TRABALHANDO COM LISTAS---------------------------------------------
    //home: listas(),
// ---------------(Evento de Clique e Alert Dialog)-----------------------------
    //home: listas_personalizadas(),
// ---------------CONSUMO DE SERVIÇO WEB (API)----------------------------------
     //home: listas_Api(),
// -------------- (USANDO POST, PUT, PATCH, DELETE)-----------------------------
    //home: listas_Api2(),

// -----------------------------APP YouTube-------------------------------------
// -Cons. um APP de vídeos, tipo: YouTube---(AppBar com Botões e Imagens)-------
    //home: youTube_AppBar(),
// -Cons. um APP de vídeos, tipo: YouTube---(BottonNavigatorBar com interação)--
    // youTube_BottomNavigatorbar(),
// -----------------YouTube Trabalhado com APIs---------------------------------
    //home: youTube_Api(), //FINAL APP

// -------------------------MANIPULAÇÃO DE DADOS--------------------------------

// -------Utilizando preferências do usuário--(Salvando dados no aparelho)------
    //home: ManipulacaoDados1(),
// -------Configurando FloatingButton--(Com Interação em bottomNavigationBar)---
    //home: FloatingButton(),

//-------------------APP LISTA DE TAREFAS- COM MANIPULAÇÃO DE ARQUIVOS----------
    //home: ListaDeTarefas(),
//--------------------------Widget DISMISSIBLE----------------------------------
    //home: WidgetDismissible(),
//-------------------APP LISTA DE TAREFAS COM ""DISMISSIBLE""-------------------
    // home: ListaDeTarefasDismissible(),
//-------------APP LISTA DE TAREFAS COM ""DISMISSIBLE"" & ""SNACKBAR""----------
     //home: ListaDeTarefasDismissSnackbar() ,
//---------------------APP LISTA DE TAREFAS (CONCLUIDA)-------------------------
    //home: ListaDeTarefasFinal(),

//------------------------------BANCO DE DADOS----------------------------------
    //home: BancoDeDados(),

//---------------------BANCO DE DADOS- (APP ANOTAÇÕES)--------------------------
//------------(APP ANOTAÇÕES) -  (Iniciando e salvando Banco de dados)----------
    //home: anotacoes(),
//------------(APP ANOTAÇÕES) -  (Listando anotações e Formatando Data)---------
    //home: anotacoes2(),
//--------(APP ANOTAÇÕES FINAL)---(Atualizando e removendo anotações)-----------
    //home: AnotacoesApp(),

//--------------------------------MÍDIAS----------------------------------------
     //home: ExecutandoSons(),
//------------Executando sons com botões--(PLAY, PAUSE, STOP e VolumeBar--------
     //home: ExecutandoSons_P_P_S(),

//-----------------------APPBAR com Abas e TabBAr-------------------------------
    //home: AppbarAbasTabBar(),

//-----Mídias -> APP Aprendendo Inglês---(Imagens, Sons, Abas e TabBar)---------
/*
    home: AprendaIngles(),

// -----------Usando Thema para todas as abas e janelas do projeto--------------
    theme: ThemeData(
        primaryColor:  Color(0xff795548),
      //accentColor:  Colors.green,
      scaffoldBackgroundColor: Color(0xfff8e6b9)
    ),
 */
// -----------------------------------------------------------------------------
//-------------------------MÍDIAS--(Executando VÍDEOS)--------------------------
     home: ExecutandoVideos(),


    title: "Aula Fluter",
    debugShowCheckedModeBanner: false,

  ));

}


