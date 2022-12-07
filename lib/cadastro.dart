import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Carro Certo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      home: const MyHomePage(title: 'Meu Carro Certo Sign in Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fullnameCtrl = TextEditingController(),
      emailCtrl = TextEditingController(),
      passwordCtrl = TextEditingController(),
      confirmPasswordCtrl = TextEditingController();

  Object? get result => null;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double maxWidth =
        queryData.size.width < 500 ? queryData.size.width : 500;
    double maxHeight = 600;

    return Scaffold(
        /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
        body: Container(
            width: queryData.size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login-bg.jpg"),
                fit: BoxFit.cover,
              )
            ),
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      child: Container(
                        width: maxWidth,
                        height: maxHeight,
                        margin: const EdgeInsets.only(
                            top: 10.0,
                            right: 20.0,
                            bottom: 10.0,
                            left: 20.0
                        ),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            )),
                        child: ListView(
                          reverse: true,
                          children: <Widget>[
                            const Padding(
                                padding:
                                EdgeInsets.only(bottom: 20.0),
                                child: Center(
                                  child: Text('Cadastrar-se',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30)),
                                )),
                            const Padding(
                                padding:
                                EdgeInsets.only(right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Nome completo',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                        controller: fullnameCtrl,
                                        scrollPadding: const EdgeInsets.only(bottom:40),
                                        decoration: const InputDecoration(
                                          hintText: 'Fulano de Tal',
                                        ),
                                        style: const TextStyle(fontSize: 18)))),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 40.0, right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Usuário',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                        controller: emailCtrl,
                                        scrollPadding: const EdgeInsets.only(bottom:40),
                                        decoration: const InputDecoration(
                                          hintText: 'exemplo@meucarrocerto.com',
                                        ),
                                        style: const TextStyle(fontSize: 18)))),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 40.0, right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Senha',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: passwordCtrl,
                                      scrollPadding: const EdgeInsets.only(bottom:40),
                                      decoration: const InputDecoration(
                                          hintText: '********'),
                                      style: const TextStyle(fontSize: 18),
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ))),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 40.0, right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Confirmar a senha',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 40.0, left: 40.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: confirmPasswordCtrl,
                                      scrollPadding: const EdgeInsets.only(bottom:40),
                                      decoration: const InputDecoration(
                                          hintText: '********'),
                                      style: const TextStyle(fontSize: 18),
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ))),
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              margin: const EdgeInsets.only(
                                  top: 20.0,
                                  right: 40.0,
                                  bottom: 20.0,
                                  left: 40.0
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                  const Color.fromRGBO(255, 210, 84, 1),
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      right: 98.0,
                                      bottom: 18.0,
                                      left: 98.0),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  if (passwordCtrl.text ==
                                      confirmPasswordCtrl.text) {
                                    loadingDialog();

                                    try {
                                      final credential = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                        email: emailCtrl.text,
                                        password: passwordCtrl.text,
                                      );
                                      if (kDebugMode) {
                                        print(credential);
                                      }
                                      var db = FirebaseFirestore.instance;

                                      final user = <String, dynamic>{
                                        "fullname": fullnameCtrl.text,
                                        "email": emailCtrl.text
                                      };

                                      try {
                                        // Add a new document with a generated ID
                                        db.collection("users").add(user).then(
                                                (DocumentReference doc) => print(
                                                'DocumentSnapshot added with ID: ${doc.id}'));
                                        Navigator.of(context,
                                            rootNavigator: true)
                                            .pop(result);

                                        _chamarLogin(context);
                                      } catch (e) {
                                        if (kDebugMode) {
                                          print(
                                              'Error on save user in Firestore collection "users"');
                                        }
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(result);

                                      if (e.code == 'weak-password') {
                                        if (kDebugMode) {
                                          print(
                                              'The password provided is too weak.');
                                        }

                                        String title = 'Falha ao cadastrar',
                                            content =
                                                'A senha expecificada é muito fraca!';
                                        signupFailedDialog(title, content);
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        if (kDebugMode) {
                                          print(
                                              'The account already exists for that email.');

                                          String title = 'Falha ao cadastrar',
                                              content =
                                                  'Já existe um usuário com esse e-mail';
                                          signupFailedDialog(title, content);
                                        }
                                      }
                                    } catch (e) {
                                      if (kDebugMode) {
                                        print(e);
                                      }
                                    }
                                  } else {
                                    String title = 'Falha ao cadastrar',
                                        content =
                                            'As senhas não são iguais, verifique e tente novamente.';
                                    signupFailedDialog(title, content);
                                  }
                                },
                                child: const Expanded(
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ].reversed.toList(),
                        )
                      )))
            ])));
  }

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
                  Text('Cadastrando usuário, aguarde...')
                ],
              ),
            ),
          );
        });
  }

  void signupFailedDialog(String title, String content) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

_chamarLogin(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ));
}
