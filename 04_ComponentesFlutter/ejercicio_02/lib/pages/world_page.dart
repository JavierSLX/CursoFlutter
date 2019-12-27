import 'package:flutter/material.dart';

class WorldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 2: Hola Mundo"),
      ),
      //El cuerpo contiene un contenedor el cual en su centro tiene un texto
      body: Container(
        alignment: Alignment.center,
        //Texto en negritas con un tamaño especifico
        child: Text("Hola mundo!!!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
      )
    );
  }
}