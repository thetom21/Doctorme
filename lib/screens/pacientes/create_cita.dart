import 'package:doctorme/services/cita_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//Realizar la cita en el calendario,
//aqui es donde se crea el calendario.
class CreateCita extends StatefulWidget {
  const CreateCita({Key key}) : super(key: key);

  @override
  _CreateCitaState createState() => _CreateCitaState();
}

class _CreateCitaState extends State<CreateCita> {
  CitaService citaService = CitaService();
  DateTime _focusedDay;
  DateTime _selectedDay;

  //Se instancea el objeto para las citas
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dr. Soler"),
        ),
        //Llamamos nuestro calendario que descargamos 
        //para poder hacer las citas.
        body: Column(
          children: [
            //Se seleccionna el dia para agendar la cita.
            TableCalendar(
              locale: 'es_Es',
              headerStyle: 
              HeaderStyle(titleCentered: true, formatButtonVisible: false),
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
            //Boton para poder agregar la cita
            //Y te dira el dia, estado y turno de la cita.
            TextButton(onPressed: () async {
              await citaService.create(
                  FirebaseAuth.instance.currentUser.email, _selectedDay);
                Navigator.pop(context);

            }, child: Text("Agendar"))
          ],
        )    //AppBar 
    );
  }
}