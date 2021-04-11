import 'dart:html';
import 'home.dart';
import 'disponible.dart';
import 'package:flutter/material.dart';



class Agregar extends StatefulWidget{
  @override
  _AgregarState createState() => _AgregarState();

  
}



class _AgregarState extends State<Agregar> {
  /*TextEditingController nombre;
  TextEditingController cantidad;
  TextEditingController precio;*/
  String nombre;
  String cantidad;
  String precio; 

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child:Form(
          key:formkey ,
          child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: ('Nombre del producto:')),
            onSaved: (value){
              nombre=value;
            },
          ),
          TextFormField(decoration: InputDecoration(
            labelText: ('Precio del producto')),
          onSaved: (value){
            precio=value;
          },
          ),
          TextFormField(decoration: InputDecoration(
            labelText: ('Cantidad del producto')),
          onSaved: (value){
            cantidad=value;
          },
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child:Text('Guardar producto') ,
            onPressed: (){_diponible(context);})
                      
                    ],),) 
                  ),
            
                );
                
              }
            
        
              void _diponible(BuildContext context) {

                  Navigator.of(context).pushNamed('/disponible',
                  arguments:Productosdisponibles(nombre:'klk',
                  cantidad:'10',
                  precio:'10'));
              }
}
  
