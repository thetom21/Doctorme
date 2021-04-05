import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_cita.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          title: Text("Citas"),
        ), //AppBar 
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextButton(onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateCita())), 
                  child: Text("Agendar Citar"))
              ],
            ),
          ),
        ),
    ); //Scaffold
  }
}