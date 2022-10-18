import 'dart:ui';

import 'package:flutter/material.dart';
import 'cadastro.dart';

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
              Text(
                "Quem Somos?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                "Meu Carro Certo foi criado com o intuito de resolver o problema de falta de informação das pessoas ao comprar sem próximo automóvel. Trazendo segurança nas informações passadas, Meu Carro Certo leva ate você as opções que se encaixam  em sua necessidade.",
                style: TextStyle(fontSize: 23),
                textAlign: TextAlign.justify,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Equipe',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Iohana Maria Linhares",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        "Designer",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Lavínia Vitoria Kuhn",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        "Designer",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Leonardo Cech",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        "Desenvolvedor",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Venício João Ayroso Tomio",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        "Desenvolvedor",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
