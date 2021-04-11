import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'agregar.dart';
import 'disponible.dart';
import 'historial.dart';
import 'despachar.dart';
import 'citas_admi.dart';

class HomePage extends StatefulWidget {
const   HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _selectDrawerIteam=0;
  _getDrawerIteamWidget(int pos){
    //posciones de la pagina para poder cambiar entra ellas 
    switch(pos){
      case 0:return CitasAdmi();
      case 1:return Disponible();
      case 2:return Agregar();
      case 3:return Despachar();
      case 4:return Historial();
    }
  }

  _onSelectIteam(int pos){
    //set state me redibuja pantalla 
    setState(() {
      Navigator.of(context).pop();
      _selectDrawerIteam=pos;
      
    });
  }


  @override
  
  
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
        body: _getDrawerIteamWidget(_selectDrawerIteam),
                          endDrawer: Drawer(
                            child:  ListView(
                              children: <Widget>[
                                UserAccountsDrawerHeader(
                                  accountName:Text('Dr.Soler'), accountEmail: null,),
                                ListTile(
                                title:Text('Disponibles'),
                                leading: Icon(Icons.assignment_turned_in),
                                selected: (1 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(1);

                                },
                              ),
                              Divider(),
                               ListTile(
                                title:Text('Agregar Articulos'),
                                leading: Icon(Icons.add_shopping_cart),
                                selected: (2 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(2);

                                },
                              ),
                              Divider(),
                               ListTile(
                                title:Text('Despacho de Articulo'),
                                leading: Icon(Icons.remove_circle),
                                selected: (3 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(3);

                                },
                              ),
                              Divider(),
                               ListTile(
                                title:Text('Historial'),
                                leading: Icon(Icons.show_chart),
                                selected: (4 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(4);
                                  
                                },
                              ),
                              Divider(),

                                      ListTile(
                                title:Text('Home'),
                                leading: Icon(Icons.home),
                                selected: (0 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(0);

                                },
                              ),
                              Divider(),
                              
                              ],),
                          ),
      
                          //extendBody: _getDrawerIteamWidget(_selectDrawerIteam),
          
                    ); //Scaffold
                  }
                }
                
               
