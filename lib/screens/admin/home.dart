import 'dart:convert';

import 'package:doctorme/screens/admin/list.dart';
import 'package:doctorme/services/cita_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CitaService citaService = CitaService();
  DateTime _focusedDay;
  DateTime _selectedDay;

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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          title: Text("Admin"),
        ), //AppBar 
        body: GridView.count(
          crossAxisCount:count ,
          children: [
            TableCalendar(
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
            CitaList(day: _selectedDay,)
           ],
        ),
    ); //Scaffold
  }
}