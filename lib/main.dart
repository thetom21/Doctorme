//import 'dart:math';
import 'package:doctorme/screens/admin/admin_app.dart';
import 'package:doctorme/screens/pacientes/home_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//Authentificación de la Base de Datos.
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
//le puse en nombre al el paquete para luego llmarlos mas adelante
import 'login.dart';
//package que quita el hashtag
import 'package:url_strategy/url_strategy.dart';
//package que agrega el cambio de idioma al calendario
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  //aqui llamo al paquete utilizado TUTORIAL *https://pub.dev/packages/flutter_dotenv*
   await DotEnv.load(fileName: ".env");
   //se setea el path para quitar el hashtag en el url
  setPathUrlStrategy();
 initializeDateFormatting().then((_) =>runApp(MyApp()));
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
               if (isAdmins(snapshot.data.email))  {
                 return AdminApp();
               }
               return HomeApp();
             });
          }// StreamBuilder

          return CircularProgressIndicator();
        });
  }
}

//Para saber cual es el usuario que esta entrando,
//si es el doctor o la secretaria.
bool isAdmins(email) => ["hola@doctor.com", "secre@doctor.com"].contains(email);