import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meu_carro_certo/formulario.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Carro Certo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      home: const MyHomePage(title: 'Meu Carro Certo Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    'assets/images/image1.jpg',
  ];

  Object? get result => null;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double maxWidth = queryData.size.width < 500 ? queryData.size.width : 500;
    double maxHeight = 500;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset("assets/images/logo.png", scale: 3),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                //onPressed: _pushSaved,
                onPressed: () {},
                tooltip: 'Editar usuário',
              )
            ]),
        body: Container(
            width: maxWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/login-bg.jpg"),
              fit: BoxFit.cover,
            )),
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        elevation: 10,
                        color: const Color.fromRGBO(255, 210, 104, 0.8),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        margin: const EdgeInsets.only(
                            top: 40.0, right: 20.0, bottom: 20.0, left: 20.0),
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: const [
                              Text(
                                "Bem-vindo(a)!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Deseja trocar de carro ou adquirir seu primeiro automóvel e não sabe qual escolher?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                "Nós te ajudamos!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ])),
                      ),
                    ),
                    // CARD 1
                    GestureDetector(
                      child: Card(
                          elevation: 10,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          margin: const EdgeInsets.all(20.0),
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Consultoria para encontrar o modelo de carro dos seus sonhos.',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "Com nossa consultoria simples você pode descobrir e entender qual o modelo de carro que mais se encaixa no seu perfil por meio de um formulario.",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            255, 210, 84, 1),
                                        padding: const EdgeInsets.only(
                                            top: 18.0,
                                            right: 98.0,
                                            bottom: 18.0,
                                            left: 98.0),
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(result);
                                        _chamarFormulario(context);
                                      },
                                      child: const Expanded(
                                        child: Text(
                                          'Acessar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    ),

                    // CARD 2
                    GestureDetector(
                      child: Card(
                          elevation: 10,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          margin: const EdgeInsets.all(20.0),
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Além disso, podemos buscar para você o Carro Certo!',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "E para você que precisa de um auxilio extra temos a Consultoria Plus para te auxiliar. Personalizando seu atendimento via contato pessoal.",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            180, 180, 180, 1),
                                        padding: const EdgeInsets.only(
                                            top: 18.0,
                                            right: 98.0,
                                            bottom: 18.0,
                                            left: 98.0),
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        /*
                                        Navigator.of(context, rootNavigator: true)
                                            .pop(result);
                                        _chamarFormulario(context);
                                        */
                                      },
                                      child: const Expanded(
                                        child: Text(
                                          'Em breve!',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    ),

                    // CARD 3
                    GestureDetector(
                      child: Card(
                          elevation: 10,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          margin: const EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Consultoria Digital traz toda informação na palma de sua mão.',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                  "Em breve teremos um aplicativo para facilitar o seu acesso as informações necessarias para encontrar seu modelo dos sonhos.",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.justify,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          180, 180, 180, 1),
                                      padding: const EdgeInsets.only(
                                          top: 18.0,
                                          right: 98.0,
                                          bottom: 18.0,
                                          left: 98.0),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      /*
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(result);
                                      _chamarFormulario(context);
                                       */
                                    },
                                    child: const Expanded(
                                      child: Text(
                                        'Em breve!',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ])));
  }
}

_chamarFormulario(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Formulario(),
      ));
}
