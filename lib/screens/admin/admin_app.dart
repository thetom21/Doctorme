import 'package:flutter/material.dart';

import 'home.dart';
import 'agregar.dart';
import 'disponible.dart';
import 'historial.dart';
import 'despachar.dart';
import 'citas_admi.dart';

class AdminApp extends StatelessWidget {
  const AdminApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Se remueve el label de debug.
      title: 'Dr. Soler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      //Rutas que las personas van a poder accesar.
      routes: {'/': (context) => HomePage(),
               '/disponible':(context)=>Disponible(),
               '/agregar':(context)=>Agregar(),
               '/historial':(context)=>Historial(),
               '/despachar':(context)=>Despachar()
      },
     
    );
  }
}
