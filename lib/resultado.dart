import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meu_carro_certo/quemsomos.dart';

import 'home.dart';
import 'login.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Carro Certo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      home: const MyHomePage(title: 'Meu Carro Certo Result Page'),
    );
  }
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                //onPressed: _pushSaved,
                onPressed: () => _key.currentState!.openEndDrawer(),
                tooltip: 'Editar usuário',
              )
            ]),
        key: _key,
        endDrawer: userEdit(context),
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
                            child: Column(children: [
                              Text(
                                "${fullnameCtrl.text}, aqui está o raking do seu carro certo",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "De acordo com as questões respondidas, esses foram os três carros selecionados para você.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.justify,
                              )
                            ])),
                      ),
                    ),
                    Card(
                      color: Colors.grey[100],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "1º",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              Image.network(
                                  'https://img0.icarros.com/dbimg/galeriaimgmodelo/2/36263_1.jpg'),
                              const Text(
                                "Gol City 1.0 Total Flex 12v (2017)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                "Fipe: R\$ 35.029,00",
                                style: TextStyle(fontSize: 14),
                              ),
                            ]),
                      ),
                    ),
                    Card(
                      color: Colors.grey[100],
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "2º",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Image.network(
                                    'https://img1.icarros.com/dbimg/galeriaimgmodelo/7/11728_1.jpg'),
                                const Text(
                                  "COBALT ADVANTAGE 1.4 (2014)",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  "Fipe: R\$ 43.913,00",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ])),
                    ),
                    Card(
                      color: Colors.grey[100],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "3º",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              Image.network(
                                  'https://img1.icarros.com/dbimg/galeriaimgmodelo/2/3736_1.jpg'),
                              const Text(
                                "Fusion 2.5 16V Aut. (Híbrido) (2012)",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                "Fipe: R\$ 49.664,00",
                                style: TextStyle(fontSize: 14),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ])));
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
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        //padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(240, 240, 240, 1),
                              textStyle: const TextStyle(fontSize: 20),
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
                              Navigator.of(context, rootNavigator: true)
                                  .pop(result);
                            },
                            child: Row(children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Atualizar meu usuário',
                                    style: TextStyle(color: Colors.lightBlue),
                                  ),
                                ),
                              ),
                            ])),
                      )),
                  const Divider(color: Colors.grey),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Outras ações:",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        textAlign: TextAlign.justify,
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        //padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(240, 240, 240, 1),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              _chamarSobre(context);
                            },
                            child: Row(children: const [
                              Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Quem somos?',
                                      style: TextStyle(color: Colors.lightBlue),
                                    ),)
                              ),
                            ])),
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        //padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(240, 240, 240, 1),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              confirmDialog(context);
                            },
                            child: Row(children: const [
                              Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Excluir conta',
                                      style: TextStyle(color: Colors.redAccent),
                                    ),)
                              ),
                            ])),
                      ))
                ])),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                margin: const EdgeInsets.only(top: 20.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 210, 84, 1),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      _key.currentState!.closeEndDrawer();
                    },
                    child: Row(children: const [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Voltar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ])),
              ))
        ],
      ));
}

_chamarLogin(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ));
}

_chamarSobre(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Sobre(),
      ));
}
