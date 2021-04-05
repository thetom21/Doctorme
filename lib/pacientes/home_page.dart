import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    ); //Scaffold
  }
}