import 'dart:html';
import 'package:doctorme/models/pacientes.dart';
import 'package:doctorme/services/cita_service.dart';
import 'package:doctorme/services/pacientes_service.dart';
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
  int edad;
  double peso; 
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
                labelText: ('peso del paciente')),
              onSaved: (value) => peso = double.tryParse(value)
                
              ,
              validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }
                },
              ),
              
              TextFormField(decoration: InputDecoration(
                labelText: ('edad del pacinete')),
              onSaved: (value) => edad = int.tryParse(value)
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
                onPressed: (){
                  showDialog(context: context,
                  barrierDismissible: false
                , builder: (context)=>AlertDialog(
                  title: Text('Guardado'),
                  content: Text('Precione OK!!'),
                  actions: [FlatButton(
                    onPressed: (){_verHistorial(context);
                    Navigator.of(context).pop('ok');}, 
                    child: Text('Ok'))],
                ));})
                          
                        ],),),
          ),
        ) 
                  ),
            
                );
                
              }
            

        //metodo llamado para validar y guadar 
        //le pasmos la infomacion y no llev a la otra pestana 
              void _verHistorial(BuildContext context) {
                if(formkey.currentState.validate()){
                  formkey.currentState.save();
                  PacienteService().create(this.nombrepaciente,this.edad,this.peso, this._emailController.toString(),this.historialP);

                }

                  
              }
}
  
