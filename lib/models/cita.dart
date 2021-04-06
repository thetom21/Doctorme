//Van a estar la representacion que tenemos en 
//nuestra base de datos.
import 'package:cloud_firestore/cloud_firestore.dart';

class Cita {
  int turn;
  DateTime day;
  String status;
  String email;
  DocumentReference reference;

//En ese metodo lo que hace es que devuelve el dia de la cita.
  String formattedDay() => '${day.day}/${day.month}/${day.year}';

//Va a transformar la data que yo le este pasando con otra data.
//Sirve para transportar datos.
  Cita.fromSnapshot(DocumentSnapshot snapshot) 
      : this.fromMap(snapshot.data.call(), reference: snapshot.reference);

  Cita.fromMap(Map<String, dynamic> map, {this.reference})
    : turn = map['turn'],
      day = map['day'].toDate(),
      status = map['status'],
      email = map['email'];
  }