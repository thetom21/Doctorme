//import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
//le puse en nombre al el paquete para luego llmarlos mas adelante

import 'email_service.dart';


Future main() async {
  //aqui llamo al paquete utilizado TUTORIAL *https://pub.dev/packages/flutter_dotenv*
   await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. Soler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  final emailService= EmailService();
  
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailForm = GlobalKey<FormState>();
  var _codeForm = GlobalKey<FormState>();
  //intancia de controller par ael mail tomar el valor del correo
  var _emailController = TextEditingController();
  var authCode = 0;//almacena el valor del codigo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr. Soler"),
      ),
      body: authCode > 0 ? codeForm() : emailForm(),
    );
  }

  Form emailForm() {
    return Form(
      key: _emailForm,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) => value.isEmpty
                      ? "Correo Requerido"
                      : EmailValidator.validate(value)
                          ? null
                          : "Correo Incorrecto",
                  decoration: InputDecoration(labelText: "Email"),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () async {
                    if (_emailForm.currentState.validate()) {
                      var code=await widget.emailService.sendSignInCode(_emailController.text);
                  
                      setState(() {
                        authCode = code;
                        print(code);
                      });
                    }
                  },
                  child: Text("Entrar")),
            )
          ],
        ),
      ),
    );
  }

  Form codeForm() {//cambio de pantalla para validar el codigo
    return Form(
      key: _codeForm,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Revisa tu correo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) =>
                      authCode > 0 && int.tryParse(value) == authCode
                          ? null
                          : "incorrecto",
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: InputDecoration(
                    labelText: "codigo",
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    if (_codeForm.currentState.validate()) {
                      print("entraste");
                    }
                  },
                  child: Text("Entrar")),
            )
          ],
        ),
      ),
    );
  }
}
