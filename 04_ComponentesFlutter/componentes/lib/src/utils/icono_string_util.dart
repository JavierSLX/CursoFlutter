import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "slider": Icons.tune
};

//Obtiene un widget de icono a partir de un nombre
Icon getIcon(String nombre)
{
  return Icon(_icons[nombre], color: Colors.blue,);
}