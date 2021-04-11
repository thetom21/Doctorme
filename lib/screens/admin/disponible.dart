import 'dart:html';
import 'package:doctorme/screens/admin/admin_app.dart';

import 'admin_app.dart';

import 'package:flutter/material.dart';

class Disponible extends StatelessWidget {
const Disponible({Key key}) : super(key: key);
  

  
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
              Text(articulos.nombre,) ,
              Text(articulos.cantidad),
              Text(articulos.precio),
              
          ],
        ),
      ),
    );
  }
}

class Productosdisponibles{
  String nombre;
   String cantidad;
   String precio;
   Productosdisponibles({this.nombre,this.cantidad,this.precio});
}