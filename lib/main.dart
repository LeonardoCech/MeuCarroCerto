import 'package:flutter/material.dart';
import 'package:meu_carro_certo/resultado.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/*
*  Build APK
*  flutter build apk --split-per-abi
*  Doc: https://docs.flutter.dev/deployment/android#build-an-apk
* */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // /// // ...
  // /// await Firebase.initializeApp(
  // ///   options: DefaultFirebaseOptions.currentPlatform,
  // /// );
  runApp(MaterialApp(
      home: const Resultado(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      )));
}
