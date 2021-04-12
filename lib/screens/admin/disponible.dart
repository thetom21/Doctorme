import 'dart:html';
import 'package:doctorme/screens/admin/admin_app.dart';

import 'admin_app.dart';

import 'package:flutter/material.dart';

class Disponible extends StatefulWidget {
const Disponible({Key key}) : super(key: key);

  @override
  _DisponibleState createState() => _DisponibleState();
}

class _DisponibleState extends State<Disponible> {
  @override
  Widget build(BuildContext context) {
    Productosdisponibles articulos =ModalRoute.of(context).settings.arguments;

    
    return Scaffold(
      appBar: AppBar(
        title: Text(' Disponible'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
              Text(articulos.nombre) ,
              Text(articulos.precio.toString()),
              Text(articulos.cantidad.toString()),
              
          ],
        ),
      ),
    );
  }
}

class Productosdisponibles{
  String nombre;
   var cantidad=0;
   var precio =0;
   Productosdisponibles({this.nombre,this.cantidad,this.precio});
}