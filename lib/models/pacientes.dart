import 'package:cloud_firestore/cloud_firestore.dart';

class Pacientes{
  String nombrepaciente;
  String historial;
   int edad=0;
   DateTime date;
   DocumentReference reference;
   double peso =0.0;
   String email;


   Pacientes({this.nombrepaciente,this.edad,this.peso, this.historial,this.email});

   Pacientes.fromSnapshot(DocumentSnapshot snapshot) 
      : this.fromMap(snapshot.data.call(), reference: snapshot.reference);

  Pacientes.fromMap(Map<String, dynamic> map, {this.reference})
    : nombrepaciente = map['nombrepaciente'],
      peso = map['peso'],
      edad = map['edad'],
      email=map['email'],
      historial= map['historial'],
      date = map['date'].toDate();

      Map<String, dynamic> toJson() {
    return {
      'nombrepaciente': this.nombrepaciente,
      'historial': this.historial,
      'edad': this.edad,
      'peso': this.peso,
      'date': this.date,
      'email': this.email
    };
}
}