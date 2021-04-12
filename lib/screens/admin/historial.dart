import 'dart:html';
import 'package:doctorme/screens/admin/ver_historial.dart';
import 'package:doctorme/services/cita_service.dart';
import 'package:email_validator/email_validator.dart';

import 'home.dart';
import 'disponible.dart';
import 'package:flutter/material.dart';



class Historial extends StatefulWidget{
  @override
  _Historial createState() => _Historial();

  
}



class _Historial extends State<Historial> {
  String nombrepaciente;
  String historialP;
  var edad = 0;
  var peso = 0; 
  var _emailController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child:Center(
          child: SizedBox(
            width: 400,
            child: Form(
              key:formkey ,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: (value) => value.isEmpty
                      ? "Correo Requerido"
                      : EmailValidator.validate(value)
                          ? null
                          : "Correo Incorrecto",
                  decoration: InputDecoration(labelText: "Email"),
                ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: ('Nombre del paciente:')),
                onSaved: (value){
                  nombrepaciente=value;
                },
                validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }
                },
              ),
              TextFormField(decoration: InputDecoration(
                labelText: ('Peso del paciente')),
              onSaved: (value) => edad = int.tryParse(value)
                
              ,
              validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }
                },
              ),
              
              TextFormField(decoration: InputDecoration(
                labelText: ('Edad del paciente')),
              onSaved: (value) => peso = int.tryParse(value)
              ,
              validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }
                },
              ),
                TextFormField(
                  decoration:InputDecoration (
                    labelText: ("Escriba aqui"),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value){historialP=value;},
                  validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }
                },
                  maxLines: 5,
                ),              
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child:Text('Guardar producto') ,
                onPressed: (){_pacientes(context);})
                          
                        ],),),
          ),
        ) 
                  ),
            
                );
                
              }
            
        //metodo llamado para validar y guadar 
        //le pasmos la infomacion y no llev a la otra pestana 
              void _pacientes(BuildContext context) {
                if(formkey.currentState.validate()){
                  formkey.currentState.save();

                  Navigator.of(context).pushNamed('/ver_historial',
                  arguments:Pacientes(email: this._emailController.text,
                    nombrepaciente:this.nombrepaciente,
                  edad:this.edad,
                  peso:this.peso,
                  historialp:this.historialP));
                }

                  
              }
}
  
