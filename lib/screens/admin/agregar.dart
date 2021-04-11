import 'dart:html';

import 'package:flutter/material.dart';



class Agregar extends StatefulWidget{
  @override
  _AgregarState createState() => _AgregarState();

  
}



class _AgregarState extends State<Agregar> {
  TextEditingController nombre;
  TextEditingController cantidad;
  TextEditingController precio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: ('Nombre del producto:')),
            controller:nombre ,
          ),
          TextField(decoration: InputDecoration(labelText: ('Precio del producto')),
          controller: precio,),
          TextField(decoration: InputDecoration(labelText: ('Cantidad del producto')),
          controller: cantidad,),
          RaisedButton(
            child:Text('Guardar producto') ,
            onPressed: (){})
          
        ],),
      ),

    );
    
  }
  @override
  void initState() { 
    super.initState();
    nombre=TextEditingController();
    cantidad=TextEditingController();
    precio=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nombre.dispose();
    cantidad.dispose();
    precio.dispose();
  }
}
  
