

import 'package:flutter/material.dart';

//Realizar la cita en el calendario,
//aqui es donde se crea el calendario.
class CreateCita extends StatelessWidget {
  const CreateCita({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dr. Soler"),
        ),
        body: Text("Agrega tu cita, aqui va el calendario")
      ); //AppBar 
  }
}