//Esto es para agregar a la base de datos.
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/cita.dart';

class CitaService{

  Future<void> create(String email, DateTime day) async {
    try{
      await FirebaseFirestore.instance.collection('citas').add({
        'email': email, 'day': day, 'turn': 1, 'status': 'pendiente'});
    } catch(e) {

    }
  }

  Future<List<Cita>> getByEmail(String email) async {
    try{
      var snapshot = await FirebaseFirestore.instance
          .collection('citas')
          .where('email', isEqualTo: email)
          .get();
      
      List<Cita> citas = [];
      snapshot.docs.forEach((element) {
        citas.add(Cita.fromSnapshot(element));
      });

      return citas;
    } catch (e) {
      print(e);
      return null;
    }
    
  }

  Future<void> cancel(DocumentReference reference) async {
    try{
      var snapshot = await FirebaseFirestore.instance
          .collection('citas')
          .doc(reference.path)
          .update({'status': 'cancelado'});
    } catch (e) {
      print(e);
    }
  }
}