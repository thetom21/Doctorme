import 'package:doctorme/models/pacientes.dart';
import 'package:doctorme/screens/admin/edit.dart';
import 'package:doctorme/services/pacientes_service.dart';
import 'package:flutter/material.dart';

class Verhistorial extends StatefulWidget {
  final Function onSelectIteam;
  Verhistorial({Key key, this.onSelectIteam}) : super(key: key);

  @override
  VerhistorialState createState() => VerhistorialState();
}

class VerhistorialState extends State<Verhistorial> {
  final paciente = PacienteService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: paciente.getAll(),
        builder: (context, snapshot) {
          List<Pacientes> paciente = snapshot.data;

          if (paciente == null || paciente.length == 0) {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
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
              itemBuilder: (context, idx) {
                Pacientes p = paciente[idx];
                return ListTile(
                  leading: Text(
                    p.edad.toString(),
                  ),
                  title: Center(child: Text(p.nombrepaciente)),
                  subtitle: Center(child: Text(p.date.toIso8601String())),
                  trailing: IconButton(
                      // Boton de editar.
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditHistorial(
                                      paciente: p,
                                    ))).then((value) {
                          setState(() {});
                        });
                      }),
                );
              });
        });
  }
}
