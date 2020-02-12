import 'package:ejercicio_02/pages/add_page.dart';
import 'package:ejercicio_02/pages/hello_page.dart';
import 'package:ejercicio_02/pages/home_page.dart';
import 'package:ejercicio_02/pages/world_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes()
{
  return <String, WidgetBuilder> {
    '/': (BuildContext context) => HomePage(),
    'mundo': (BuildContext context) => WorldPage(),
    'contador': (BuildContext context) => AddPage(),
    'saludo': (BuildContext context) => HelloPage()
  };
}