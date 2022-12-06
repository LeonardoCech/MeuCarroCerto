import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          child: formUI(),
        ),
      )),
    );
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
        // IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     size: 30,
        //     color: Colors.black,
        //   ),
        //   onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        // ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Nos conte sobre você...",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "O questionário foi criado pensando em perguntas exclusivas, onde analisaremos e definiremos o Carro Certo para você.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ),

        formItemsDesign(
            Icons.numbers,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Idade',
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
              padding: const EdgeInsets.only(top: 7.0),
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
              padding: const EdgeInsets.only(top: 7.0),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Sim'),
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
                      title: const Text('Não'),
                      value: SingingCharacter.nao,
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
                      title: const Text('Talvez'),
                      value: SingingCharacter.talvez,
                      groupValue: _characterComprarSozinho,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _characterComprarSozinho = value;
                        });
                      },
                    ),
                  )
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
                  'Ar condicionado',
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
                  options: const ['Até 15.0', 'De 16 a 20', "Mais"],
                  selectedValues: selectedConsumo,
                  whenEmpty: 'Selecione a média de consumo (Por km)',
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
            title:
                const Text("Qual faixa de valor do veículo que você procura?"),
            subtitle: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selectedValores = x;
                  });
                },
                options: const [
                  'RS20.000',
                  'RS30.000',
                  'RS40.000',
                  'RS50.000',
                  "Mais"
                ],
                selectedValues: selectedValores,
                whenEmpty: 'Selecione as faixar de valor',
              ),
            ),
          ),
        ),

        //BOTÃO DE ENVIO DE FORMULARIO
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              color: const Color.fromRGBO(255, 210, 84, 1),
            ),
            child: const Text("Concluir",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300)),
          ),
        )
      ],
    );
  }
}
