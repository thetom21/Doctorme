//import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//Authentificación de la Base de Datos.
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
//le puse en nombre al el paquete para luego llmarlos mas adelante


import 'pacientes/home_app.dart';
import 'login.dart';


Future main() async {
  //aqui llamo al paquete utilizado TUTORIAL *https://pub.dev/packages/flutter_dotenv*
   await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<User>(
              stream:FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
               if (snapshot.data == null) {
                 return LoginApp();
               }
               return HomeApp();
             });
          }// StreamBuilder

          return CircularProgressIndicator();
        });
  }
}

