import 'package:doctorme/services/articulo_service.dart';
import 'package:flutter/material.dart';



class Agregar extends StatefulWidget{
  final Function onSelectIteam;

  const Agregar({Key key, this.onSelectIteam}) : super(key: key);
  @override
  _AgregarState createState() => _AgregarState();

  
}



class _AgregarState extends State<Agregar> {
  String nombre;
  var cantidad = 0;
  var precio = 0.0; 

  final formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(200.0),
        child:Center(
          child: SizedBox(
            width: 400,
            child: Form(
              key:formkey ,
              child: Column(children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: ('Nombre del producto:')),
                onSaved: (value){
                  nombre=value;
                },
                validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para guardar";
                  }return null;
                },
              ),
              TextFormField(decoration: InputDecoration(
                labelText: ('Precio del producto')),
              onSaved: (value) => precio = double.tryParse(value)
                
              ,
              validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para gurdar";
                  } return null;
                },
              ),
              TextFormField(decoration: InputDecoration(
                labelText: ('Cantidad del producto')),
              onSaved: (value) => cantidad = int.tryParse(value)
              ,
              validator: (value){
                  if(value.isEmpty){
                    return "llene este campo para gurdar";
                  } return null;
                },
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child:Text('Guardar producto') ,
                onPressed: ()
                {showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context)=>AlertDialog(
                  title: Text('Guardado'),
                  content: Text('Precione OK!!'),
                  actions: [FlatButton(
                    onPressed: (){_diponible(context);
                    Navigator.of(context).pop('ok');}, 
                    child: Text('Ok'))],
                ));})
                          
                        ],),),
          ),
        ) 
                  ),
            
                );
                
              }
            
        
              void _diponible(BuildContext context) {
                if(formkey.currentState.validate()){
                  formkey.currentState.save();
                  ArticuloService().create(this.nombre, this.cantidad, this.precio);
                  //widget.onSelectIteam(1);
                  //poner un mensage de que se guardo 
                }

                  
              }
}
  
