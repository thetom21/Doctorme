import 'package:doctorme/screens/admin/citaform.dart';
import 'package:doctorme/screens/admin/list.dart';
import 'package:doctorme/services/cita_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CitasAdmi extends StatefulWidget {
const   CitasAdmi({Key key}) : super(key: key);

  @override
  _CitasAdmi createState() => _CitasAdmi();
}

class _CitasAdmi extends State<CitasAdmi> {
  CitaService citaService = CitaService();
  DateTime _focusedDay;
  DateTime _selectedDay;
  bool expanded = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }
  
  @override
  Widget build(BuildContext context) {
    //variables para poder arreglar el porblema del tamano del calendario
    var count = 2; 
    if(MediaQuery.of(context).size.width<700){
      count = 1;
    }
    return Scaffold(
        body: GridView.count(
          crossAxisCount:count ,
          children: [
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
            Column(
              children: [
                TextButton(onPressed: () {setState(() {
                  expanded = !expanded;
                });}, child: Text("Agregando Cita")),
                Visibility(visible: expanded,child: CitaForm(day: _selectedDay,
                refreshDay: (){
                  setState(() {
                    
                  });
                },)),
                              Expanded(child: CitaList(day: _selectedDay,)),
                              ],
                            )
                           ],
                        ),
                          
          
                    ); //Scaffold
                  }
                }