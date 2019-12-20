import 'package:flutter/material.dart';

//El StatelessWidget no permite cambios dinamicos en su clase
class HomePage extends StatelessWidget
{
  final TextStyle estiloTexto = new TextStyle(fontSize: 24);
  final int conteo = 10;

  @override
  Widget build(BuildContext context) 
  {
    //Un scaffold es una pantalla con una barra y un boton flotante
    return Scaffold(
      appBar: AppBar( //Appbar con un titulo centrado
        title: Text("Titulo"),
        centerTitle: true,
      ),
      body: Center( //El cuerpo de la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Columna centrica
          children: <Widget>[ //Arreglo de Widgets en forma de columna
            Text("Número de clicks:", style: estiloTexto),
            Text("$conteo", style: TextStyle(fontSize: 30.0),) //Muestra el valor de la variable
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), //Agrega el icono de +
        onPressed: () {
          print("Hola mundo");
        }, //Evento al presionar suma en 1 la variable
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, //Centra el boton flotante en el centro
    );
  }
}