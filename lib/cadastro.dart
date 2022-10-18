import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meu_carro_certo/home.dart';
import 'home.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  get children => null;

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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
        body: Container(
            width: 10000,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/login-bg.jpg"),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 230.0, right: 20.0, bottom: 230.0, left: 20.0),
                        child: Container(
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
                                    child: Text('Efetuar Cadastro',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 30)),
                                  )),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Nome',
                                          style: TextStyle(fontSize: 18)))),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Fulano de Tal'),
                                        style: TextStyle(fontSize: 18),
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                      ))),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 60.0, right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Usuário',
                                          style: TextStyle(fontSize: 18)))),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                          decoration: InputDecoration(
                                            hintText:
                                                'exemplo@meucarrocerto.com',
                                          ),
                                          style: TextStyle(fontSize: 18)))),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 60.0, right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Senha',
                                          style: TextStyle(fontSize: 18)))),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: '********'),
                                        style: TextStyle(fontSize: 18),
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                      ))),
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 60.0, right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Confirmar senha',
                                          style: TextStyle(fontSize: 18)))),
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 60.0, left: 60.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: '********'),
                                        style: TextStyle(fontSize: 18),
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(top: 60.0),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            255, 210, 84, 1),
                                        padding: const EdgeInsets.only(
                                            top: 18.0,
                                            right: 160.0,
                                            bottom: 18.0,
                                            left: 160.0),
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        _chamarHome(context);
                                      },
                                      child: const Expanded(
                                          child: Text(
                                        'Cadastrar',
                                        style: TextStyle(color: Colors.white),
                                      )))),
                            ],
                          ),
                        ))))));
  }
}

_chamarHome(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ));
}
