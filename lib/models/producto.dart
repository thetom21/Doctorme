import 'package:cloud_firestore/cloud_firestore.dart';

class Producto{
  String nombre;
   var cantidad=0;
   DateTime date;
   DocumentReference reference;
   var precio =0;
   Producto({this.nombre,this.cantidad,this.precio});

   Producto.fromSnapshot(DocumentSnapshot snapshot) 
      : this.fromMap(snapshot.data.call(), reference: snapshot.reference);

  Producto.fromMap(Map<String, dynamic> map, {this.reference})
    : nombre = map['nombre'],
      precio = map['precio'],
      cantidad = map['cantidad'],
      date = map['date'].toDate();
      
}