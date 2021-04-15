import 'package:doctorme/screens/admin/ver_historial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'agregar.dart';
import 'disponible.dart';
import 'historial.dart';
import 'citas_admi.dart';

class HomePage extends StatefulWidget {
const   HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

int _selectDrawerIteam=0;
var title='Admin';
  _getDrawerIteamWidget(int pos){
    //posciones de la pagina para poder cambiar entra ellas 
    switch(pos){
      case 0:
      title = 'Admin';
      return CitasAdmi();
      case 1: 
      title = 'Articulos Disponible';
      return Disponible(onSelectIteam:_onSelectIteam);
      case 2:
      title = 'Agregar Articulo';
      return Agregar(onSelectIteam:_onSelectIteam);
      case 3:
      title = 'Vista Expediente';
      return Verhistorial();
      case 4:
      title = 'Crear Expedediente';
      return Historial();
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
    //variables para poder arreglar el problema del tamano del calendario
    if(MediaQuery.of(context).size.width<700){
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          title: Text('ADMIN'),
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
                                title:Text('Ver Expedientes'),
                                leading: Icon(Icons.account_box_outlined),
                                selected: (3 ==_selectDrawerIteam),
                                onTap: (){
                                  _onSelectIteam(3);

                                },
                              ),
                              Divider(),
                               ListTile(
                                title:Text('Expediente'),
                                leading: Icon(Icons.create_new_folder),
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
                
               
