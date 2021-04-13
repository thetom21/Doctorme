import 'package:cloud_firestore/cloud_firestore.dart';

class Pacientes{
  String nombrepaciente;
  String historialP;
   int edad=0;
   DateTime date;
   DocumentReference reference;
   double peso =0.0;
   String email;


   Pacientes({this.nombrepaciente,this.edad,this.peso, this.historialP,this.email});

   Pacientes.fromSnapshot(DocumentSnapshot snapshot) 
      : this.fromMap(snapshot.data.call(), reference: snapshot.reference);

  Pacientes.fromMap(Map<String, dynamic> map, {this.reference})
    : nombrepaciente = map['nombrepaciente'],
      peso = map['peso'],
      edad = map['edad'],
      email=map['email'],
      historialP= map['hitorialP'],
      date = map['date'].toDate();
}