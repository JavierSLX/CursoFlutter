import 'package:ejercicio_02/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio App',
      debugShowCheckedModeBanner: false,
      //Ruta Inicial
      initialRoute: '/',
      //Las rutas que puede tomar la app
      routes: getRoutes(),
    );
  }
}