import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider
{
  List<dynamic> opciones = [];

  _MenuProvider()
  {
    cargarData();
  }

  //Carga el JSON de la carpeta data y regresa en un futuro la lista
  Future<List<dynamic>> cargarData() async
  {
    //Obtiene un future de la lectura del documento y al resolverlo obtiene un mapa del json obtenido
    /*rootBundle.loadString("data/menu_opts.json").then((data) {
      Map dataMap = json.decode(data);
      print(dataMap['rutas']);

      opciones = dataMap['rutas'];
    });*/

    String data = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(data);

    opciones = dataMap['rutas'];

    //Regresa la lista de opciones
    return opciones;
  }
}

final menuProvider = new _MenuProvider();