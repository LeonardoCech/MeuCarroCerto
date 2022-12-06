import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
  final urlImages = [
    'assets/images/image1.jpg',
  ];
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
                "Bem vindo (a)!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Deseja trocar de carro ou adquirir seu primeiro automóvel e não sabe qual escolher?",
                style: TextStyle(fontSize: 23),
                textAlign: TextAlign.justify,
              ),
              const Text(
                "Nós te ajudamos!",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
              // ListView(
              //   children: [
              //     CarouselSlider.builder(
              //       options: CarouselOptions(height: 400),
              //       itemCount: urlImages.length,
              //       itemBuilder: (context, index, realIndex) {
              //         final urlImage = urlImages[index];
              //         return buildImage(urlImage, index);
              //       },
              //     )
              //   ],
              // ),

              // CARD 1
              GestureDetector(
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Consultoria para encontrar o modelo de carro dos seus sonhos.',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Com nossa consultoria simples você pode descobrir e entender qual o modelo de carro que mais se encaixa no seu perfil por meio de um formulario.",
                        style: TextStyle(fontSize: 23),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 210, 84, 1),
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                right: 160.0,
                                bottom: 18.0,
                                left: 160.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Expanded(
                            child: Text(
                              'Acessar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // CARD 2
              GestureDetector(
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Além disso, podemos buscar para você o Carro Certo!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "E para você que precisa de um auxilio extra temos a Consultoria Plus para te auxiliar. Personalizando seu atendimento via contato pessoal.",
                        style: TextStyle(fontSize: 23),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 210, 84, 1),
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                right: 160.0,
                                bottom: 18.0,
                                left: 160.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Expanded(
                            child: Text(
                              'Acessar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // CARD 3
              GestureDetector(
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Consultoria Digital traz toda informação na palma de sua mão.',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Em breve teremos um aplicativo para facilitar o seu acesso as informações necessarias para encontrar seu modelo dos sonhos.",
                        style: TextStyle(fontSize: 23),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 210, 84, 1),
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                right: 160.0,
                                bottom: 18.0,
                                left: 160.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Expanded(
                            child: Text(
                              'Acessar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // Widget buildImage(String urlImage, int index) => Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 12),
  //       color: Colors.white,
  //       child: Image.network(
  //         urlImage,
  //         fit: BoxFit.cover,
  //       ),
  //     );
}
