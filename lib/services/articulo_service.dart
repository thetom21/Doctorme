//Esto es para agregar a la base de datos.
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorme/models/producto.dart';
import 'package:doctorme/screens/admin/disponible.dart';


import '../models/cita.dart';
import '../models/cita.dart';
import '../models/cita.dart';

class ArticuloService{

  Future<void> create(String nombre, int cantidad,double precio) async {
    try{
      
      await FirebaseFirestore.instance.collection('articulos').add({
        'nombre': nombre, 'cantidad': cantidad, 'precio': precio,'date':DateTime.now()});
    } catch(e) {

    }
  }

  Future<List<Producto>> getAll() async {
    try{
      var snapshot = await FirebaseFirestore.instance
          .collection('articulos')
          .get();
      
      List<Producto> articulos = [];
      snapshot.docs.forEach((element) {
        articulos.add(Producto.fromSnapshot(element));
      });

      articulos.sort((a, b) => b.date.compareTo(a.date));

      return articulos;
    } catch (e) {
      print(e);
      return null;
    }
    
  }

  
}