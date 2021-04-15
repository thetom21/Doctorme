import 'package:doctorme/models/producto.dart';
import 'package:doctorme/services/articulo_service.dart';
import 'package:flutter/material.dart';

/*class Disponible extends StatefulWidget {
const Disponible({Key key}) : super(key: key);

  @override
  _DisponibleState createState() => _DisponibleState();
}

class _DisponibleState extends State<Disponible> {
  @override
  Widget build(BuildContext context) {
    Producto articulos =ModalRoute.of(context).settings.arguments;

    
    return Scaffold(
      appBar: AppBar(
        title: Text(' Disponible'),
      ),
      body: DisponibleList()
    );
  }
}*/
// Es donde se nos mostraran la lista de los pacientes 
// y sus datos con su turno.


class Disponible extends StatefulWidget {
final Function onSelectIteam;
 Disponible({Key key,this.onSelectIteam}) : super(key: key);

  @override
   DisponibleState createState() =>  DisponibleState();
}

class  DisponibleState extends State <Disponible> {
  final articuloService = ArticuloService();
  
  @override
  Widget build(BuildContext context) {

        return FutureBuilder(
          future:
           articuloService.getAll(), 
          builder: (context, snapshot) {
            List<Producto> articulos = snapshot.data;

           if (articulos == null || articulos.length == 0){
              return Padding(
                padding: const EdgeInsets.all(50.0),
                child: Align(
                  alignment: Alignment.topCenter,
                child:Text(
                  "No hay Articulos ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                ),  
              );
            }
            
            return ListView.builder(
              itemCount: articulos.length,
              itemBuilder: (context,idx){
                Producto c = articulos[idx];
                return ListTile(
                  leading: Text(c.cantidad.toString(),),
                  title: Center(child: Text(c.nombre)),
                  subtitle: Center(child: Text(c.date.toIso8601String())),
                  trailing: IconButton( // Boton de cancelar.
                      icon: Icon(Icons.edit), 
                      onPressed:(){}
                      
                  
                  ),
              );
          });
          });
      }
    }
//clase creada parta las variables y poder pasar la 
//informacion que se le pide 
