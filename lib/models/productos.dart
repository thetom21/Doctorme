import 'package:flutter/foundation.dart';

class Producto with ChangeNotifier{
   final String id;
   final String nombreProducto;
   final String descripcion;
   final double precio;
 
  Producto({
  @required this.nombreProducto, 
  @required this.descripcion, 
  @required this.precio, 
  @required this.id,});
}

class Productos with ChangeNotifier {
  List <Producto> _items=[
    Producto( 
    nombreProducto: 'puya', 
    descripcion: 'para puyyar',  
    precio: 200, 
    id: '1')


  ];

 List<Producto> get iteams{
   return[... _items];
 }
}