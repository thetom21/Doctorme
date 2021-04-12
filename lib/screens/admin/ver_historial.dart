import 'dart:html';
import 'package:doctorme/screens/admin/admin_app.dart';


import 'admin_app.dart';

import 'package:flutter/material.dart';

class   Verhistorial extends StatefulWidget {
const Verhistorial({Key key}) : super(key: key);

  @override
  _VerhistorialState createState() => _VerhistorialState();
}

class _VerhistorialState extends State<Verhistorial> {
  @override
  Widget build(BuildContext context) {
    Pacientes expediente =ModalRoute.of(context).settings.arguments;

    
    return Scaffold(
      appBar: AppBar(
        title: Text(' Expedientes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
              Text(expediente.email.toString()) ,
              Text(expediente.nombrepaciente),
              Text(expediente.edad.toString()),
              Text(expediente.peso.toString()),
              Text(expediente.historialp),

              
          ],
        ),
      ),
    );
  }
}
//clase creada para llamar las variables que se le pidebn y pasarlas 
//a los argumentos 
class Pacientes{
  String nombrepaciente;
   var edad=0;
   var peso =0;
   var email;
   String historialp;
   Pacientes({this.nombrepaciente,this.edad,this.peso,this.email,this.historialp});
}