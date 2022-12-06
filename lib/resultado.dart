import 'dart:ui';

import 'package:flutter/material.dart';
import 'cadastro.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text(
                "Raking",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                "De acordo com as questões respondidas, esses foram os três carros selecionados para você.",
                style: TextStyle(fontSize: 23),
                textAlign: TextAlign.justify,
              ),
              Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "1º",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        Image.network('https://t2.tudocdn.net/605376?w=1920',
                            height: 250, width: 150),
                        const Text(
                          "Celta 1.0 LT - 2011/2012 - Branco - Alcool/Gasolina - 78CV/1000.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "RS 2,00",
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
                            'https://portallubes.com.br/wp-content/uploads/2018/06/104951105-model-3-red-rear-sunset-1910x1000_770x433_acf_cropped-1.jpg',
                            height: 250,
                            width: 150),
                        const Text(
                          "Tesla-Model-S-2021-5",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "RS 2,00",
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
                          "3º",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        Image.network(
                            'https://portallubes.com.br/wp-content/uploads/2018/06/104951105-model-3-red-rear-sunset-1910x1000_770x433_acf_cropped-1.jpg',
                            height: 250,
                            width: 150),
                        const Text(
                          "Tesla-Model-S-2021-5",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "RS 2,00",
                          style: TextStyle(fontSize: 14),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
