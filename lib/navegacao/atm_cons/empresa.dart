import 'package:flutter/material.dart';

class empresa extends StatefulWidget {
  const empresa({Key? key}) : super(key: key);

  @override
  _empresaState createState() => _empresaState();
}

class _empresaState extends State<empresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text("Empresa"),
          backgroundColor: Color(0xffec7148),
        ),

        body: SingleChildScrollView(

          child: Container(
            margin: EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget> [

                Row(
                  children: <Widget> [

                    Padding(padding: EdgeInsets.only(bottom: 15, right: 10),
                      child: Image.asset("imagens/atm_cons/detalhe_empresa.png"),
                    ),

                    Text(
                        "Sobre a Empresa",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffec7148),
                        )),
                  ],),

                Text("Entenda como o Google apoia o \n "
                    "jornalismo e te conecta a notícias relevantes!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),

                Padding(padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Text(
                    "Nosso compromisso com as notícias",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const Text("Nossos produtos são desenvolvidos para fornecer informações "
                    "relevantes e úteis para todos, garantindo que pessoas de todo o "
                    " mundo possam encontrar as notícias que mais importam. Como parte "
                    "disso, desempenhamos um papel construtivo, possibilitando um "
                    "ecossistema de notícias sustentável, independente e diverso.\n \n"
                    "Demonstramos esse compromisso ao longo de décadas de apoio"
                    " financeiro, investindo bilhões de dólares — compartilhando receita"
                    "com organizações jornalísticas por meio de nossa rede de anúncios, "
                    "desenvolvendo ferramentas, treinamento e financiamento com programas "
                    "como a Google News Initiative e lançando o Google Destaques, um programa "
                    "de licenciamento de conteúdo para o Google Notícias. Por meio dessas e outras "
                    "ações, contribuímos com quantias significativas de dinheiro às empresas de jornalismo.",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),

              ],),
          ),
        )
    );
  }
}
