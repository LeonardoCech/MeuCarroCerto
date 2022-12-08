import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final emailCtrl = TextEditingController(),
    nameCtrl = TextEditingController(),
    passwordCtrl = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    'assets/images/image1.jpg',
  ];

  Object? get result => null;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double maxWidth = queryData.size.width < 500 ? queryData.size.width : 500;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset("assets/images/logo.png", scale: 3),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.black),
                onPressed: () => _key.currentState!.openEndDrawer(),
                tooltip: 'Editar usuário',
              )
            ]),
        key: _key,
        endDrawer: userEdit(),
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
                                      onPressed: () {},
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

Widget userEdit() {
  final currUserEmail = FirebaseAuth.instance.currentUser?.email;
  var db = FirebaseFirestore.instance;

  emailCtrl.text = currUserEmail!;

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await db.collection("users").where("email", isEqualTo: currUserEmail).get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    Map<String, dynamic> result = allData.first as Map<String, dynamic>;
    nameCtrl.text = result['fullname'];
  }

  getData();

  /*for (var doc in snapshot.data!.docs) {
    print(doc.data() as Map<String, dynamic>);
  }*/

  return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      Card(
        elevation: 10,
        color: const Color.fromRGBO(255, 255, 255, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        margin: const EdgeInsets.only(
            top: 20.0, right: 15.0, bottom: 20.0, left: 15.0),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Configurações",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Edite suas informações de usuário:",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: nameCtrl,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  controller: emailCtrl,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: passwordCtrl,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: 'Nova senha',
                    ),
                    obscureText: true,
                  ))
            ])),
      )
    ],
  ));
}

_chamarFormulario(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Formulario(),
      ));
}
