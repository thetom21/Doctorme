import 'package:doctorme/screens/admin/cita_form.dart';
import 'package:doctorme/services/cita_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CitaService citaService = CitaService();
  DateTime _focusedDay;
  DateTime _selectedDay;
  bool expanded;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    expanded = false;
  }
  
  @override
  Widget build(BuildContext context) {
    
    // Esto es para que cuando la pantalla este mas pequeña,
    // por si la aplicación de pone para telefono, te permita ver esa pantalla
    // en un a sola sin tener ningun problema.
    var count = 2;
    if (MediaQuery.of(context).size.width < 700) {
      count = 1;
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          title: Text("Admin"),
        ), //AppBar 
        body: GridView.count( // Esto sirve para dividir la pantalla 
          crossAxisCount: count, // en dos columnas.
          children: [
            TableCalendar(
              locale: 'es_ES',
              headerStyle: HeaderStyle(
                titleCentered: true, formatButtonVisible: false),
            selectedDayPredicate: (day) => _selectedDay == day,
            onDaySelected: (selectedDay, focusedDay){
              setState(() {
                _focusedDay = selectedDay;
                _selectedDay = selectedDay;
              });
            },
            focusedDay: _focusedDay,
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(Duration(days: 300))),

            
            Column(
              children: [
                TextButton(onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                }, child: Text('Agregar Cita')),
                Visibility( visible: expanded, child: CitaForm(day: _selectedDay,
                refreshDay: () {
                  setState(() {});
                },
              )),
                Expanded(
                      child: CitaList(
                      day: _selectedDay,
                    ),
                ),
              ],
            )
           ],
        ),
    ); //Scaffold
  }
}