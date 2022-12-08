import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                                "Raking do seu carro certo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
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
                              Image.asset("assets/images/unknown-car.jpg"),
                              const Text(
                                "Celta 1.0 LT - 2011/2012 - Branco - Alcool/Gasolina - 78CV/1000.",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                "De R\$ 25.000,00 a R\$35.000",
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
                                Image.asset("assets/images/unknown-car.jpg"),
                                const Text(
                                  "Tesla-Model-S-2021-5",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                                const Text(
                                  "De R\$ 25.000,00 a R\$35.000",
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
                              Image.asset("assets/images/unknown-car.jpg"),
                              const Text(
                                "Tesla-Model-S-2021-5",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                "De R\$ 25.000,00 a R\$35.000",
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

Widget userEdit() {
  final currUserEmail = FirebaseAuth.instance.currentUser?.email;
  var db = FirebaseFirestore.instance;

  emailCtrl.text = currUserEmail!;
  Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
      db.collection("users").where("email", isEqualTo: currUserEmail).get();

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
