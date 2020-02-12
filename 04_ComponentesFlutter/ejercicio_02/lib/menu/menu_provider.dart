import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider
{
  List<dynamic> opciones = [];

  //Carga la lista en el constructor
  _MenuProvider()
  {
    cargarData();
  }

  //Regresa una lista en un futuro
  Future<List<dynamic>> cargarData() async
  {
    //Obtiene el JSON en un string y lo convierte en Map
    String data = await rootBundle.loadString("data/menu.json");
    Map dataMap = json.decode(data);

    opciones = dataMap['rutas'];

    //Regresa la lista de opciones
    return opciones;
  }
}

//Instancia el menu
final menu = new _MenuProvider();