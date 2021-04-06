// Es donde se nos mostraran la lista de los pacientes 
// y sus datos con su turno.

import 'package:doctorme/cita_service.dart';
import 'package:doctorme/models/cita.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CitaList extends StatefulWidget {
 CitaList({Key key}) : super(key: key);

  @override
   CitaListState createState() =>  CitaListState();
}

class  CitaListState extends State <CitaList> {
  @override
  Widget build(BuildContext context) {

        return FutureBuilder(
          future: CitaServise().getByEmail(
            FirebaseAuth.instance.currentUser.email), 
          builder: (context, snapshot) {
            if (snapshot.hasData || snapshot.data.leght == 0){
              return Container(child:Text("No tiene citas"),
              );
            }

            List<Cita> citas = snapshot.data;
            return ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context,idx){
                Cita c = citas[idx];
                return ListTile(
                  leading: Text(c.turn.toString()),
                  title: Text(c.formattedDay()),
                  trailing: c.status == 'cancelled' ? null 
                  : IconButton(icon: Icon(Icons.close), onPressed: () => {}),
              );
          });
          });
      }
    }