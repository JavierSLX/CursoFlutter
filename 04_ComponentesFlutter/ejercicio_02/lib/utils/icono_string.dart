import 'package:flutter/material.dart';

//Lista de Iconos
final _icons = <String, IconData>{
  "world": Icons.public,
  "add": Icons.add,
  "hello": Icons.record_voice_over
};

//Obtiene un Icon a partir de un nombre
Icon getIcon(String nombre)
{
  return Icon(_icons[nombre], color: Colors.blue,);
}