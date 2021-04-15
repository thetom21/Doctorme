//Esto es para agregar a la base de datos.
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cita.dart';

class CitaService{

  Future<void> create(String email, DateTime day) async {
    try{
      //Se pone le pone el turno que le toca al paciente.
      var citasOfTheDay = await getByDay(day);
      var turn = 1;
      citasOfTheDay.forEach((element) => turn = max(element.turn + 1, turn));
        if(turn <= 3) {
          await FirebaseFirestore.instance.collection('citas').add({ //Instaciar base de datos en el campo de lista.
          'email': email, 'day': day, 'turn': turn, 'status': 'pendiente'});
        }else{
          print("Cupos llenos, seleccione otro día");
        }
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

      citas.sort((a, b) => b.day.compareTo(a.day));

      return citas;
    } catch (e) {
      print(e);
      return null;
    }
    
  }

   Future<void> cancel(Cita cita) async {
    try{
      await FirebaseFirestore.instance
          .doc(cita.reference.path)
          .update({'status': 'cancelado', 'turn':  0});

      await updateCitasAfterTurn(cita.day, cita.turn); //Actualizar la cita despues de un turno.
          } catch (e) {
            print(e);
          }
        }
      
        Future<List<Cita>> getByDay(DateTime day) async{
          try{
            var nextDay = day.add(Duration(days: 1));
            var snapshot = await FirebaseFirestore.instance
                .collection('citas')
                .where('day', isGreaterThanOrEqualTo: day, isLessThan: nextDay)
                .get();
            
            List<Cita> citas = [];
            snapshot.docs.forEach((element) {
              citas.add(Cita.fromSnapshot(element));
            });
      
            citas.sort((a, b) => a.turn.compareTo(b.turn));
      
            return citas;
          } catch (e) {
            print(e);
            return null;
          }
        }

    Future<void> updateCitasAfterTurn(DateTime day, int turn) async {
      try{
        var dbCitas = await getByDay(day); //Se busca todas las citas que son de ese dia.
        List<Cita> citas = [];
        //Filtra para tener todas las que van desde ese turno que se acaba de cancelar.
        dbCitas.forEach((c) {
          if (c.turn >= turn) {
            citas.add(c);
          }
        });
           //Organizar por turno.
        citas.sort((a, b) => b.turn.compareTo(a.turn));

        List<Future> futures = [];
        //Se le agrega el valor que va hacer en la actualizacion.
        citas.forEach((element) {
          futures.add(
            FirebaseFirestore.instance
            .doc(element.reference.path)
            .update({'turn': turn}));
            turn++; // Aqui le va asignando un numero a partir de la que se cancela.
          });
        
        await Future.wait(futures); //Va a la base de dados y actualiza todas las citas.
      } catch (e) {
        print(e);
        return null;
      }
   }
}