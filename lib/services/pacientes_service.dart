//Esto es para agregar a la base de datos.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorme/models/pacientes.dart';

class PacienteService{

  //esto agrega a la base de dato

  Future<void> create(String nombrepaciente, int edad,double peso,String email,String historialP) async {
    try{
      
      await FirebaseFirestore.instance.collection('pacientes').add({
        'nombrepaciente': nombrepaciente, 'edad': edad,'historialp':historialP, 
        'peso': peso,'email':email, 'date':DateTime.now()});
    } catch(e) {

    }
  }
// busca los productos en la base de datos 
  Future<List<Pacientes>> getAll() async {
    try{
      var snapshot = await FirebaseFirestore.instance
          .collection('pacientes')
          .get();
      
      List<Pacientes> paciente = [];
      snapshot.docs.forEach((element) {
        paciente.add(Pacientes.fromSnapshot(element));
      });

      paciente.sort((a, b) => b.date.compareTo(a.date));

      return paciente;
    } catch (e) {
      print(e);
      return null;
    }
    
  }

  
}