import 'package:doctorme/models/pacientes.dart';
import 'package:doctorme/services/pacientes_service.dart';
import 'package:flutter/material.dart';

class Verhistorial extends StatefulWidget {
final Function onSelectIteam;
 Verhistorial({Key key,this.onSelectIteam}) : super(key: key);

  @override
   VerhistorialState createState() =>  VerhistorialState();
}

class  VerhistorialState extends State <Verhistorial> {
  final paciente = PacienteService();
  
  @override
  Widget build(BuildContext context) {

        return FutureBuilder(
          future:
           paciente.getAll(), 
          builder: (context, snapshot) {
            List<Pacientes> paciente = snapshot.data;

           if (paciente == null || paciente.length == 0){
              return Padding(
                padding: const EdgeInsets.all(50.0),
                child: Align(
                  alignment: Alignment.topCenter,
                child:Text(
                  "No hay Expedinetes ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                ),  
              );
            }
            
            return ListView.builder(
              itemCount: paciente.length,
              itemBuilder: (context,idx){
                Pacientes c = paciente[idx];
                return ListTile(
                  leading: Text(c.edad.toString(),),
                  title: Center(child: Text(c.nombrepaciente)),
                  subtitle: Center(child: Text(c.date.toIso8601String())),
                  trailing: IconButton( // Boton de editar.
                      icon: Icon(Icons.edit), 
                      onPressed:(){}
                      
                  
                  ),
              );
          });
          });
      }
    }
