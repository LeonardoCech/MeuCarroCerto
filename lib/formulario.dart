import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meu_carro_certo/resultado.dart';
import 'package:multiselect/multiselect.dart';
import 'package:meu_carro_certo/quemsomos.dart';

import 'home.dart';
import 'login.dart';

enum SingingCharacter { sim, nao, talvez }

class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);

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
  Object? get result => null;

  List<String> selectedResursos = [];
  List<String> selectedValores = [];
  List<String> selectedCarros = [];
  List<String> selectedCategoria = [];
  List<String> selectedConsumo = [];

  SingingCharacter? _characterCarroProprio = SingingCharacter.sim;
  SingingCharacter? _characterComprarSozinho = SingingCharacter.sim;
  SingingCharacter? _characterFilhos = SingingCharacter.sim;
  SingingCharacter? _characterViagemFrequente = SingingCharacter.sim;
  SingingCharacter? _characterCategoria = SingingCharacter.sim;
  SingingCharacter? _characterPortaMalas = SingingCharacter.sim;
  SingingCharacter? _characterConsumo = SingingCharacter.sim;

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
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              ),
              SingleChildScrollView(
                  child: Container(
                margin: const EdgeInsets.all(16.0),
                child: Form(
                  child: formUI(),
                ),
              )),
            ])));
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  String checkbox = "";

  Widget formUI() {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Card(
            elevation: 10,
            color: const Color.fromRGBO(255, 210, 104, 0.8),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            margin: const EdgeInsets.only(
                top: 20.0, right: 5.0, bottom: 20.0, left: 5.0),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: const [
                  Text(
                    "Nos conte sobre você...",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "O questionário foi criado pensando em perguntas exclusivas, onde analisaremos e definiremos o Carro Certo para você.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ])),
          ),
        ),

        formItemsDesign(
            Icons.numbers,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Qual a sua idade?',
              ),
              keyboardType: TextInputType.number,
            )),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Já possui carro próprio?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterCarroProprio,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterCarroProprio = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterCarroProprio,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterCarroProprio = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _characterCarroProprio == SingingCharacter.sim,
          child: formItemsDesign(
            Icons.car_crash,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Qual carro possui?',
              ),
            ),
          ),
        ),
        Visibility(
          visible: _characterCarroProprio == SingingCharacter.sim,
          child: formItemsDesign(
            Icons.car_crash,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'A quanto tempo está com o carro?',
              ),
            ),
          ),
        ),
        Visibility(
          visible: _characterCarroProprio == SingingCharacter.sim,
          child: formItemsDesign(
            Icons.car_crash,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Qual o motivo da troca?',
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Tem confiança em comprar um carro sozinho(a)?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim', style: TextStyle(fontSize: 13)),
                      value: SingingCharacter.sim,
                      groupValue: _characterComprarSozinho,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterComprarSozinho = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não', style: TextStyle(fontSize: 13)),
                      value: SingingCharacter.nao,
                      groupValue: _characterComprarSozinho,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterComprarSozinho = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("O carro será usado para..."),
            subtitle: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selectedCarros = x;
                  });
                },
                options: const ['Trabalho', 'Passeio', 'Dia a dia', "Outro"],
                selectedValues: selectedCarros,
                whenEmpty: 'Selecione o uso do seu carro',
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Tem filhos?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterFilhos,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterFilhos = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterFilhos,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterFilhos = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Viaja com frequência?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterViagemFrequente,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterViagemFrequente = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterViagemFrequente,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterViagemFrequente = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Tem preferência em categoria de carro?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterCategoria,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterCategoria = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterCategoria,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterCategoria = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _characterCategoria == SingingCharacter.sim,
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ListTile(
              title: const Text("Qual a categoria desejada?"),
              subtitle: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    setState(() {
                      selectedCategoria = x;
                    });
                  },
                  options: const ['Esportiva', 'Popular', "Outra"],
                  selectedValues: selectedCategoria,
                  whenEmpty: 'Selecione a categoria',
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Porta-malas importa?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterPortaMalas,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterPortaMalas = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterPortaMalas,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterPortaMalas = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text(
                "Principais recursos que um carro precisa ter para você?"),
            subtitle: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selectedResursos = x;
                  });
                },
                options: const [
                  'Ar-condicionado',
                  'Quatro portas',
                  'Travas elétricas',
                  'Outros',
                  'Sem preferencias'
                ],
                selectedValues: selectedResursos,
                whenEmpty: 'Selecione os recursos',
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text("Tem preferência por média de consumo?"),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
                      value: SingingCharacter.sim,
                      groupValue: _characterConsumo,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterConsumo = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
                      groupValue: _characterConsumo,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterConsumo = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _characterConsumo == SingingCharacter.sim,
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ListTile(
              title: const Text("Qual a média de consumo ideal para você?"),
              subtitle: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    setState(() {
                      selectedConsumo = x;
                    });
                  },
                  options: const [
                    'Menos de 12 Km/L',
                    'Entre 13 e 17 Km/L',
                    "Mais de 17 Km/L"
                  ],
                  selectedValues: selectedConsumo,
                  whenEmpty: 'Selecione a média de consumo',
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          shadowColor: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            title: const Text(
                "Qual faixa de valor (Tabela FIPE) do veículo que você procura?"),
            subtitle: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selectedValores = x;
                  });
                },
                options: const [
                  'Até R\$ 20.000',
                  'Até R\$ 40.000',
                  'Até R\$ 60.000',
                  'Até R\$ 80.000',
                  "Qualquer valor"
                ],
                selectedValues: selectedValores,
                whenEmpty: 'Selecione as faixas de valor',
              ),
            ),
          ),
        ),

        //BOTÃO DE ENVIO DE FORMULARIO
        GestureDetector(
            onTap: () {},
            child: Container(
              //padding: const EdgeInsets.only(right: 5.0, left: 5.0),
              margin: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 210, 84, 1),
                    padding: const EdgeInsets.only(
                        top: 18.0, right: 75.0, bottom: 18.0, left: 75.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _chamarResultado(context);
                  },
                  child: Row(children: const [
                    Expanded(
                      child: Text(
                        'Quero meu carro certo!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ])),
            ))
      ],
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

_chamarResultado(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Resultado(),
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
