import 'package:contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget
{
  //Construye el widget
  @override
  Widget build(context)
  {
    //Regresa un Widget centrado donde su hijo es un texto centrado
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quita la etiqueta de debug
      home: ContadorPage() //Widget creado
    );
  }
}