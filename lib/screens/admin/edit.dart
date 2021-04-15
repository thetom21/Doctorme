import 'package:doctorme/models/pacientes.dart';
import 'package:doctorme/services/pacientes_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';



class EditHistorial extends StatefulWidget {
  final Pacientes paciente;

  const EditHistorial({Key key, this.paciente}) : super(key: key);
  @override
  _EditHistorial createState() => _EditHistorial();
}

class _EditHistorial extends State<EditHistorial> {
  var _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text=widget.paciente.email;
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADMIN'),),
      body: Padding(
          padding: const EdgeInsets.all(200.0),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      onSaved: (value) {
                        widget.paciente.email = value;
                      },
                      validator: (value) => value.isEmpty
                          ? "Correo Requerido"
                          : EmailValidator.validate(value)
                              ? null
                              : "Correo Incorrecto",
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      initialValue: widget.paciente.nombrepaciente,
                      decoration:
                          InputDecoration(labelText: ('Nombre del paciente:')),
                      onSaved: (value) {
                        widget.paciente.nombrepaciente = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "llene este campo para guardar";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: widget.paciente.peso.toString(),
                      decoration:
                          InputDecoration(labelText: ('peso del paciente')),
                      onSaved: (value) =>
                          widget.paciente.peso = double.tryParse(value),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "llene este campo para guardar";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: widget.paciente.edad.toString(),
                      decoration:
                          InputDecoration(labelText: ('edad del pacinete')),
                      onSaved: (value) =>
                          widget.paciente.edad = int.tryParse(value),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "llene este campo para guardar";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: widget.paciente.historial,
                      decoration: InputDecoration(
                        labelText: ("Escriba aqui"),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        widget.paciente.historial = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "llene este campo para guardar";
                        }
                        return null;
                      },
                      maxLines: 5,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(color: Colors.white))),
                        child: Text('Guardar producto'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                    title: Text('Guardado'),
                                    content: Text('Precione OK!!'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            _save(context);
                                            Navigator.of(context).pop('ok');
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ));
                        })
                  ],
                ),
              ),
            ),
          )),
    );
  }

  //metodo llamado para validar y guadar
  //le pasmos la infomacion y no llev a la otra pestana
  void _save(BuildContext context) {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      PacienteService().update(widget.paciente);
    }
  }
}
