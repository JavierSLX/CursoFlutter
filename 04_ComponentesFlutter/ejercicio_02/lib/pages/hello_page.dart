import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class HelloPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 2: Saludando"),
      ),
      body: _lista(),
    );
  }

  //Crea la ListView
  Widget _lista()
  {
    //Crea un widget que interactua directamente con un futuro que se resuelve dinamicamente
    return FutureBuilder(
      //El futuro a analizar
      future: _cargarNombres(),
      //Valor inicial antes de que se resuelva el futuro
      initialData: [],
      //Resolviendo el futuro
      builder: ((BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        //Regresa la ListView
        return ListView(
          children: _listaElementos(snapshot.data, context),
        );
      }),
    );
  }

  //Crea la lista de los elementos
  List<Widget> _listaElementos(List<dynamic> data, BuildContext context)
  {
    List<Widget> elementos = [];

    //Obtiene cada uno de los elementos
    for(dynamic opt in data)
    {
      String nombre = opt["nombre"];
      String direccion = opt["direccion"];

      //Widget de tipo tarjeta
      Widget widget = ListTile(
        //Titulo de la tarjeta
        title: Text("Hola $nombre, de $direccion"),
        //Icono de la tarjeta
        leading: Icon(Icons.accessibility_new, color: Colors.blue,),
      );

      //Agrega el widget en la lista
      elementos..add(widget)..add(Divider());
    }

    return elementos;
  }

  //Obtiene la lista de nombres a saludar
  Future<List<dynamic>> _cargarNombres() async
  {
    //Obtiene el JSON en un string y lo convierte en Map
    String data = await rootBundle.loadString("data/saludar.json");
    Map map = json.decode(data);

    return map["nombres"];
  }
}