import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

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
    fullnameCtrl = TextEditingController(),
    passwordCtrl = TextEditingController();

String userDocId = "";

class _MyHomePageState extends State<MyHomePage> {
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
      endDrawer: userEdit(context),
      body: Container(
          width: maxWidth,
          child: Stack(children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            ),
            SingleChildScrollView(
                child: Container(
              margin: const EdgeInsets.all(16.0),
              child: Form(
                child: QuemSomos(),
              ),
            ))
          ])),
    );
  }

  Widget QuemSomos() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Quem Somos?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Text(
            "Meu Carro Certo foi criado com o intuito de resolver o problema de falta de informação das pessoas ao comprar sem próximo automóvel. Trazendo segurança nas informações passadas, Meu Carro Certo lava ate você as opções que se encaixam  em sua necessidade.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Equipe:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 18.0),
                            child: const Text(
                              "Iohana Maria Linhares",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text(
                              "Desenvolvimento front-end",
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 18.0),
                            child: const Text(
                              "Lavínia Vitória Kuhn",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text(
                              "Design UX e prototipação",
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 18.0),
                            child: const Text(
                              "Leonardo Cech",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text(
                              "Desenvolvimento back-end e BD",
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 18.0),
                            child: const Text(
                              "Venício João Ayroso Tomio",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text(
                              "Desenvolvimento front-end",
                              style: TextStyle(fontSize: 18),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 210, 84, 1),
                      padding: const EdgeInsets.all(23.0),
                    ),
                    onPressed: () {
                      _chamarHome(context);
                    },
                    child: const Expanded(
                      child: Text(
                        'Voltar',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget userEdit(BuildContext context) {
  final currUserEmail = FirebaseAuth.instance.currentUser?.email;
  var db = FirebaseFirestore.instance;

  emailCtrl.text = currUserEmail!;

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await db
        .collection("users")
        .where("email", isEqualTo: currUserEmail)
        .get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    Map<String, dynamic> result = allData.first as Map<String, dynamic>;
    fullnameCtrl.text = result['fullname'];

    userDocId = querySnapshot.docs.map((doc) => doc.id).single;
  }

  getData();

  void loadingDialog() {
    showDialog(
        // The user CANNOT close this dialog  by pressing outside it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  // Some text
                  Text('Aguarde...')
                ],
              ),
            ),
          );
        });
  }

  void successUpdateDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Sucesso!'),
        content: const Text('O usuário foi atualizado :)'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void confirmDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(result);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Confirmar", style: TextStyle(color: Colors.redAccent)),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(result);
        FirebaseAuth.instance.currentUser!.delete();
        db.collection("users").doc(userDocId).delete();
        _chamarLogin(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Atenção!", style: TextStyle(color: Colors.redAccent)),
      content: const Text("Tem certeza que devemos remover seu usuário?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      Card(
        elevation: 10,
        color: const Color.fromRGBO(255, 255, 255, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        margin: const EdgeInsets.only(
            top: 40.0, right: 15.0, bottom: 20.0, left: 15.0),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Configurações",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: TextFormField(
                  controller: emailCtrl,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                  enabled: false,
                ),
              ),
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
                  controller: fullnameCtrl,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 240, 0.8),
                    padding: const EdgeInsets.all(18.0),
                  ),
                  onPressed: () {
                    final user = <String, dynamic>{
                      "email": emailCtrl.text,
                      "fullname": fullnameCtrl.text,
                    };
                    loadingDialog();
                    db
                        .collection("users")
                        .doc(userDocId)
                        .update(user)
                        .then((value) => {successUpdateDialog()});
                    Navigator.of(context, rootNavigator: true).pop(result);
                  },
                  child: const Expanded(
                    child: Text(
                      'Atualizar meu usuário',
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Outrras ações:",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    textAlign: TextAlign.justify,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 240, 0.8),
                    padding: const EdgeInsets.all(23.0),
                  ),
                  onPressed: () {
                    _chamarSobre(context);
                  },
                  child: const Expanded(
                    child: Text(
                      'Quem Somos?',
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 240, 0.8),
                    padding: const EdgeInsets.all(23.0),
                  ),
                  onPressed: () {
                    confirmDialog(context);
                  },
                  child: const Expanded(
                    child: Text(
                      'Excluir conta',
                      style: TextStyle(fontSize: 15, color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
            ])),
      )
    ],
  ));
}

_chamarHome(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ));
}

_chamarSobre(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Sobre(),
      ));
}

_chamarLogin(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ));
}
