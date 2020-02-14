import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pila de widgets
      body: Stack(
        children: <Widget>[
          fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                titulos(),
                botonesRendodeados(),
              ],
            ),
          )
        ],
      ),
      //Barra de navegacion
      bottomNavigationBar: bottomNavigationBar(context)
    );
  }

  Widget fondoApp()
  {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      //Crea el efecto de transicion de color llamado gradiente
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Coordenadas comienza en la esquina superior izquierda (0, 0) hasta la otra esquina (1, 1)
          begin: FractionalOffset(0.0, 0.5),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1),
            Color.fromRGBO(35, 37, 57, 1)
          ]
        )
      ),
    );

    //EL transform permite rotar el widget en un angulo determinado (en radianes)
    final cajaRosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360,
        width: 360,
        //Crea una decoracion con gradiente de colores
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ]
          )
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        //Posiciona el widget usando coordenadas
        Positioned(
          top: -100,
          child: cajaRosada,
        ),
      ],
    );
  }

  Widget titulos()
  {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Classify transaction", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Classify this transaction into a particular category", style: TextStyle(color: Colors.white, fontSize: 18))
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context)
  {
    //Tema para personalizar un widget
    return Theme(
      //Define los colores del fondo, del color del icono y del fondo del color del icono
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1)))
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30,),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30,),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30,),
            title: Container()
          ),
        ],
      ),
    );
  }

  Widget botonesRendodeados()
  {
    return Table(
      children: [
        TableRow(
          children: [
            crearBotonRedondeado(Colors.blue, Icons.border_all, "General"),
            crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, "Bus"),
          ]
        ),
        TableRow(
          children: [
            crearBotonRedondeado(Colors.pinkAccent, Icons.shop, "Buy"),
            crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, "File"),
          ]
        ),
        TableRow(
          children: [
            crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, "Entertaiment"),
            crearBotonRedondeado(Colors.green, Icons.cloud, "Grocery"),
          ]
        ),
        TableRow(
          children: [
            crearBotonRedondeado(Colors.red, Icons.collections, "Photos"),
            crearBotonRedondeado(Colors.teal, Icons.help_outline, "Help"),
          ]
        ),
      ],
    );
  }

  Widget crearBotonRedondeado(Color color, IconData icono, String texto)
  {
    //Hace el widget con efecto borroso
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            //Da espacio de manera homogenea
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 35,
                child: Icon(icono, color: Colors.white, size: 30,),
              ),
              Text(texto, style: TextStyle(color: color),)
            ],
          ),
        ),
      ),
    );
  }
}