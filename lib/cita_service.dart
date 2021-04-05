//Esto es para agregar a la base de datos.
import 'package:cloud_firestore/cloud_firestore.dart';

class CitaServise{

  Future<void> create(String email, DateTime day) async {
    try{
      await FirebaseFirestore.instance.collection('citas').add({
        'email': email, 'day': day, 'turn': 1, 'status': 'pendiente'});
    } catch(e) {

    }
  }
}