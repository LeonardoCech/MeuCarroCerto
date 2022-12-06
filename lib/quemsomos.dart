import 'package:flutter/material.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
          'Meu Carro Certo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          child: QuemSomos(),
        ),
      )),
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
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  'Equipe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )),
          Row(
            children: [
              Column(
                children: const [
                  Text("Iohana Maria Linhares",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    "Designer",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Text("Lavínia Vitoria Kuhn",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    "Designer",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Text("Leonardo Cech",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    "Desenvolvedor",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Column(
                children: const [
                  Text("Venício João Ayroso Tomio",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    "Desenvolvedor",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
