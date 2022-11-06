import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meu_carro_certo/cadastro.dart';
import 'package:meu_carro_certo/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Meu Carro Certo Login Page'),
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
  final emailCtrl = TextEditingController(),
      passwordCtrl = TextEditingController();

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
        queryData.size.width < 500 ? queryData.size.width * 0.5 : 500;
    double maxHeight = 500;

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
            )),
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
                        margin: const EdgeInsets.all(20.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            )),
                        child: Column(
                          children: [
                            const Padding(
                                padding:
                                    EdgeInsets.only(top: 40.0, bottom: 40.0),
                                child: Center(
                                  child: Text('Meu Carro Certo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 35)),
                                )),
                            const Padding(
                                padding:
                                    EdgeInsets.only(right: 60.0, left: 60.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Usuário',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 60.0, left: 60.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                        controller: emailCtrl,
                                        decoration: const InputDecoration(
                                          hintText: 'exemplo@meucarrocerto.com',
                                        ),
                                        style: const TextStyle(fontSize: 18)))),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 60.0, right: 60.0, left: 60.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Senha',
                                        style: TextStyle(fontSize: 18)))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    right: 60.0, left: 60.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: passwordCtrl,
                                      decoration: const InputDecoration(
                                          hintText: '********'),
                                      style: const TextStyle(fontSize: 18),
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                    ))),
                            Container(
                              padding: const EdgeInsets.only(top: 20.0),
                              margin: const EdgeInsets.only(top: 20.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(255, 210, 84, 1),
                                  padding: const EdgeInsets.only(
                                      top: 18.0,
                                      right: 145.0,
                                      bottom: 18.0,
                                      left: 145.0),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  loadingDialog();
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: emailCtrl.text,
                                            password: passwordCtrl.text);
                                    if (kDebugMode) {
                                      print(credential);
                                    }
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(result);
                                    _chamarHome(context);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      if (kDebugMode) {
                                        print('No user found for that email.');
                                      }
                                    } else if (e.code == 'wrong-password') {
                                      if (kDebugMode) {
                                        print(
                                            'Wrong password provided for that user.');
                                      }
                                    }
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(result);
                                    loginFailedDialog();
                                  }
                                },
                                child: const Expanded(
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        _chamarCadastro(context);
                                      },
                                      child: const Text('Sou novo por aqui'),
                                    ),
                                  ],
                                ))
                          ],
                        ),
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
                  Text('Aguarde...')
                ],
              ),
            ),
          );
        });
  }

  void loginFailedDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Falha no login'),
        content: const Text('O usuário ou a senha estão incorretos'),
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

_chamarCadastro(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Cadastro(),
      ));
}

_chamarHome(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ));
}
