import 'package:flutter/material.dart';

import 'home_page.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Se remueve el label de debug.
      title: 'Dr. Soler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      //Rutas que las personas van a poder accesar.
      routes: {'/': (context) => HomePage()},
     
    );
  }
}

